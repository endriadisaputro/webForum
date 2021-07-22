<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use CyrildeWit\EloquentViewable\InteractsWithViews;
use CyrildeWit\EloquentViewable\Contracts\Viewable;

class Tag extends Model implements Viewable
{
    use HasFactory;
    use InteractsWithViews;
    public function forums()
    {
        // return $this->belongsToMany(Forum::class);
        return $this->belongsToMany('App\Models\Forum');
    }
}
