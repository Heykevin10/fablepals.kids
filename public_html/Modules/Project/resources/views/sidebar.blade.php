<li class="{{ isRoute('admin.fabworld.list') ? 'active' : '' }}">
    <a class="nav-link" href="{{ route('admin.fabworld.list') }}">
        <i class="fas fa-lightbulb"></i>
        <span>{{ __('Fabworld’s page') }} </span>
    </a>
</li>
<!--<li class="{{ isRoute('admin.project.*') ? 'active' : '' }}">
    //<a class="nav-link" href="{{ route('admin.project.index') }}">
     //   <i class="fas fa-lightbulb"></i>
     //   <span>{{ __('Characters') }} </span>
   // </a>
</li>-->
<li class="{{ isRoute('admin.character.list') ? 'active' : '' }}">
    <a class="nav-link" href="{{ route('admin.character.list') }}">
        <i class="fas fa-lightbulb"></i>
        <span>{{ __('Character’s page') }} </span>
    </a>
</li>
<li class="menu-header">{{ __('Music Section') }}</li>

<li class="{{ isRoute('admin.song.list') ? 'active' : '' }}">
    <a class="nav-link" href="{{ route('admin.song.list') }}">
        <i class="fas fa-lightbulb"></i>
        <span>{{ __('Songs') }} </span>
    </a>
</li>
<li class="{{ isRoute('admin.song.playlist.list') ? 'active' : '' }}">
    <a class="nav-link" href="{{ route('admin.song.playlist.list') }}">
        <i class="fas fa-lightbulb"></i>
        <span>{{ __('Song Playlists') }} </span>
    </a>
</li>
<li class="{{ isRoute('admin.song.artist.list') ? 'active' : '' }}">
    <a class="nav-link" href="{{ route('admin.song.artist.list') }}">
        <i class="fas fa-lightbulb"></i>
        <span>{{ __('Song Artists') }} </span>
    </a>
</li>
