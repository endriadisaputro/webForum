<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- <script src="{{ asset('js/app.js') }}" defer></script> -->
    <!-- <script src="{{ asset('js/app.js') }}"></script> -->
    
    <title>TC-Forum | @yield('title')</title>

    <!-- Select2 -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Styles -->    
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">  
    <link href="{{ asset('css/style.css') }}" rel="stylesheet"> 
    <link href="{{ asset('css/select2.min.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light navbar-laravel" style=" background-color: #2ab27b;">
            <div class="container" id="nav_ul">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button> 
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto" id="nav_ul">
                    <li><a class="nav-link" href="{{ route('forum.index') }}">{{ __('Forum') }}</a></li>

                   </ul> 
                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto" id="nav_ul"> 
             <!-- Authentication Links -->
                  @guest
                    <li ><a class="nav-link" id="b" href="{{ route('login') }}">{{ __('Login') }}</a></li>
                    <li><a class="nav-link" id="b" href="{{ route('register') }}">{{ __('Register') }}</a></li>
                  @else
                     <span class="input-group-btn" style="padding: 5px; margin-right: 11px;">
                    <button class="btn btn-tc" type="button" ><i class="fa fa-star"></i> </button>
                    <button class="btn btn-tc" type="button" ><i class="fa fa-inbox"></i> </button>
                    <button class="btn btn-tc" type="button" ><i class="fa fa-info"></i> </button>
                    <button class="btn btn-tc" type="button" ><i class="fa fa-question"></i></button>
                  </span>
                        <li class="nav-item dropdown">
                           <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>  Menu <span class="caret"></span>
                             </a> 
                            <div class="dropdown-menu"  aria-labelledby="navbarDropdown"> 
                               <a class="dropdown-item" href="{{ route('forum.create') }}" style="color: #444;">
                                        {{ __('Buat Pertanyaan') }}
                                </a> 
                                </div>
                            </li>

                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu"  aria-labelledby="navbarDropdown">
                                  
                                    <a class="dropdown-item" href="{{route('profile', Auth::user()->name )}}" style="color: #444;">
                                        {{ __('Profile') }}
                                    </a>
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();" style="color: #444;">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4"> 
            <div class="container">
                @include('layouts.info')               
            

            @yield('content')
            @include('layouts.footer')
            </div>
 
        </main>
    </div>


    <!-- Scripts -->   
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.1.0/highlight.min.js"></script>
    
    @yield('js')
</body>
</html>
