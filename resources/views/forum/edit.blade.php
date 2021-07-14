@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{route('forum.update', $forum->id)}}" enctype="multipart/form-data">
                    	{{csrf_field()}}
                        {{method_field('PUT')}}
                    	<div class="form-group">
                    		<input class="form-control" type="text" name="title" value="{{$forum->title}}">
                    	</div>
                    	<div class="form-group">
                    		<textarea class="form-control" name="description" >{{$forum->description}}</textarea>
                    	</div>
                        <div class="form-group">
                            <input class="form-control" type="file" name="image">
                        </div>
                    	<div class="form-group">
                            <div class="col-md-4">
                    		  <img src="{{asset('images/'.$forum->image)}}" width="100%">
                            </div>
                    	</div>
                    	<button class="btn btn-success btn-block" type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection