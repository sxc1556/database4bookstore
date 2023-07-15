import datetime
from math import fabs

from django.shortcuts import render, redirect
from my_library.models import Customer, Record, Invoice, Payment
from django.contrib.auth import login,logout,authenticate
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required,permission_required
from django.contrib.auth.models import User
from django.urls import reverse
import django.utils.timezone as timezone
from decimal import *
from django.db.models import Max

# Create your views here.
def my_register(request):
    if request.method == "GET":
        return render(request, "users/new_register.html")
    #获取用户提供的数据
    else:
        username = request.POST.get("username")
        pwd = request.POST.get("password")
        fname = request.POST.get("firstname")
        lname = request.POST.get("lastname")
        passport = request.POST.get("passport")
        email = request.POST.get("email")
        mobile = request.POST.get("mobile")
        #添加到数据库,假设table名是UserInfo
        #UserInfo.objects.create(name = username, password = pwd, mobile = mobile)
        User.objects.create_superuser(username = username, password = pwd, email=email)
        id = User.objects.get_by_natural_key(username).id

        new_customer = Customer(customer_id =id,firstname= fname,lastname = lname,phonenumber = mobile,email = email, passport = passport)
        new_customer.save()
        return HttpResponseRedirect(reverse('users:login'))



def my_login(request):

    if request.method == 'GET':
        return render(request,'users/new_login.html')
    else:
        username = request.POST.get('username')
        password = request.POST.get('password')
        remember = request.POST.get('remember')
        #使用Django自带的authenticat()函数判断是否有该用户
        user = authenticate(username=username,password=password)
        #如果存在该用户并且状态是激活的
        if user and user.is_active:
            #使用Django的login()函数进行登陆
            login(request,user)
            #如果记住登陆，则使用全局的过期时间，默认为2周
            if remember:
                # 设置为None，则表示使用全局的过期时间
                request.session.set_expiry(None)
            else:
                #否则设为0，关掉浏览器就注销登陆状态了
                request.session.set_expiry(0)
            #获取next页面（原本要访问的页面，因为没登陆所以转到login页面了），如果有的话则重定向到该页面
            next_url = request.GET.get('next')
            if next_url:
                return redirect(next_url)
            else:
                return HttpResponseRedirect(reverse('my_library:books'))
        else:
            return HttpResponse('Wrong username or password')

# def my_logout(request):
#     logout(request)
#     return HttpResponseRedirect(reverse('my_library:index'))

@login_required
def my_records(request):
    customer_id = request.user.id
    records = Record.objects.filter(customer_id = customer_id)
    num = len(list(records))
    if request.method != 'POST':

        context = {'records':records, 'num':num}
        return render(request, 'users/new_my_records.html', context)
    else:
        for record in records:
            if str(record.record_id) in request.POST:

                this_record  =Record.objects.get(record_id = record.record_id)
                edate = record.expected_return_date
                adate = timezone.now()
                status = 'Late'
                if edate >= adate:
                    status = 'Return'
                this_record.actual_return_date = adate
                this_record.return_status = status
                this_record.save()
                return HttpResponseRedirect(reverse('users:my_records'))
@login_required
def my_invoice(request):
    customer_id = request.user.id
    #records = Record.objects.filter(customer_id = customer_id)
    invoices = Invoice.objects.filter(record__customer_id = customer_id).values('invoice_id','record__actual_return_date','invoice_status','invoice_amount')
    payments = Payment.objects.none()

    for invoice in invoices:
        payment = Payment.objects.filter(invoice = invoice['invoice_id'])
        payments = payments | payment
    num = len(invoices)
    num2 = len(payments)
    if request.method != 'POST':

        context = {'invoices':invoices, "payments":payments,'num':num, 'num2':num2}
        return render(request, 'users/new_my_invoices.html', context)

def reset(request):
    return render(request,'users/reset.html')
@login_required
def payment(request,invoice_id):
    invoice = Invoice.objects.get(invoice_id = invoice_id)
    context = {'invoice':invoice}
    if request.method != 'POST':
        return render(request, 'users/payment.html', context)
    else:
        method = request.POST.get('method')
        amount = request.POST.get('amount')
        amount = Decimal.from_float(float(amount))
        balance = invoice.invoice_amount - amount
        if balance < 0:
            balance = 0
        if fabs(balance) <= 1e-6:
            invoice.invoice_status = 1
        invoice.invoice_amount = balance
        invoice.save()

        max_record_id = Payment.objects.all().aggregate(max=Max('payment_id'))
        if not max_record_id['max']:
            id = 1
        else:
            id = max_record_id['max'] + 1
        new_payment = Payment(payment_id = id, paymentamount = amount, paymentmethod = method, invoice_id = invoice.invoice_id)
        new_payment.save()
        return HttpResponseRedirect(reverse('users:my_invoices'))