@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{route('forum.store')}}" enctype="multipart/form-data">
                    	{{csrf_field()}}
                    	<div class="form-group">
                    		<input class="form-control" type="text" name="title" placeholder="Input Title..">
                    	</div>
                        <div class="form-group">
                            <textarea class="form-control" name="description" placeholder="Description.."></textarea>
                        </div>
                    	<div class="form-group">
                    		<select name="tags" class="form-control">
                                @foreach ($tags as $tag)
                                    <option value="{{$tag->id}}">{{$tag->name}}</option>
                                @endforeach
                            </select>
                    	</div>
                    	<div class="form-group">
                    		<input class="form-control" type="file" name="image">
                    	</div>
                    	<button class="btn btn-success btn-block" type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection