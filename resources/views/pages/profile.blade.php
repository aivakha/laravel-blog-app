@extends('layout')

@section('content')

    <!--main content start-->
    <div class="main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-8">

                    <div class="leave-comment mr0"><!--leave comment-->

                        @if(session('status'))
                            <div class="alert alert-success">
                                {{session('status')}}
                            </div>
                        @endif

                        <h3 class="text-uppercase">My profile</h3>
                        @include('admin.errors')
                        <br>

                        <img src="{{$user->getImage()}}" alt="" class="profile-image">

                        {{Form::open([
                            'route' => ['profile.update', $user->id],
                            'files' => true,
                            'method' => 'put',
                            'class' => 'form-horizontal contact-form',
                        ])}}
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" class="form-control" id="name" name="name" value="{{$user->name}}" placeholder="Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" class="form-control" id="email" name="email" value="{{$user->email}}" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="password">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="file" class="form-control" id="image" name="avatar">
                                </div>
                            </div>
                            <button type="submit" name="submit" class="btn send-btn">Update</button>

                        {{Form::close()}}

                    </div><!--end leave comment-->
                </div>
                @include('pages._sidebar')
            </div>
        </div>
    </div>
    <!-- end main content-->

@endsection
