from django.contrib.auth.models import User
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.urls import reverse
from django.shortcuts import render


def index(request):
    print("USER>>>. ", request.user)
    if request.user.is_anonymous:
        return render(request, 'papers/login.html')
    return HttpResponse("Papers index site")



class LoginView(generic.CreateView):
    model = User
    template_name = 'papers/login.html'