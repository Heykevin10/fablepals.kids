<?php

use Illuminate\Support\Facades\Route;
use Modules\Project\app\Http\Controllers\ProjectController;
use Modules\Project\app\Http\Controllers\CharacterController;
use Modules\Project\app\Http\Controllers\FabworldController;
use Modules\Project\app\Http\Controllers\ProjectUtilityController;

Route::middleware(['auth:admin', 'translation'])->name('admin.')->prefix('admin')->group(function () {
    Route::resource('project', ProjectController::class)->names('project')->except('show');
    Route::put('/project/status-update/{id}', [ProjectController::class, 'statusUpdate'])->name('project.status-update');
	

    Route::controller(ProjectUtilityController::class)->group(function () {
        Route::get('project-gallery/{id}', 'showGallery')->name('project.gallery');
        Route::put('project-gallery/{id}', 'updateGallery')->name('project.gallery.update');
        Route::delete('project-gallery/{id}', 'deleteGallery')->name('project.gallery.delete');
    });
	
	
});
//New characters routes
Route::get('admin/characters/list', [CharacterController::class, 'index'])->name('admin.character.list');
Route::post('admin/characters/store', [CharacterController::class, 'store'])->name('admin.character.store');
Route::get('admin/characters/create', [CharacterController::class, 'create'])->name('admin.character.create');
Route::get('admin/characters/edit', [CharacterController::class, 'edit'])->name('admin.character.edit');
Route::put('admin/characters/edit/{project}/{code}', [CharacterController::class, 'update'])->name('admin.character.update');
Route::put('admin/characters/status/{id}', [CharacterController::class, 'statusUpdate'])->name('admin.character.status-update');
Route::delete('admin/characters/destroy/{id}', [CharacterController::class, 'destroy'])->name('admin.character.destroy');
Route::delete('admin/project-gallery/image/{id}', [CharacterController::class, 'destroyGalleryImage'])->name('admin.project.gallery.destroy');

Route::get('admin/fabworld/list', [FabworldController::class, 'index'])->name('admin.fabworld.list');
Route::post('admin/fabworld/store', [FabworldController::class, 'store'])->name('admin.fabworld.store');
Route::get('admin/fabworld/create', [FabworldController::class, 'create'])->name('admin.fabworld.create');
Route::get('admin/fabworld/edit', [FabworldController::class, 'edit'])->name('admin.fabworld.edit');
Route::put('admin/fabworld/edit/{project}', [FabworldController::class, 'update'])->name('admin.fabworld.update');
Route::put('admin/fabworld/status/{id}', [FabworldController::class, 'statusUpdate'])->name('admin.fabworld.status-update');
Route::delete('admin/fabworld/destroy/{id}', [FabworldController::class, 'destroy'])->name('admin.fabworld.destroy');
Route::delete('admin/fabworld-gallery/image/{id}', [FabworldController::class, 'destroyGalleryImage'])->name('admin.fabworld.gallery.destroy');

Route::get('admin/song/list', [FabworldController::class, 'songList'])->name('admin.song.list');
Route::post('admin/song/store', [FabworldController::class, 'songSave'])->name('admin.song.save');
Route::get('admin/song/create', [FabworldController::class, 'songForm'])->name('admin.song.create');
Route::get('admin/song/edit/{id}', [FabworldController::class, 'songForm'])->name('admin.song.edit');
//Route::put('admin/song/edit/{project}', [FabworldController::class, 'update'])->name('admin.song.update');
Route::delete('admin/song/destroy/{id}', [FabworldController::class, 'songDestroy'])->name('admin.song.destroy');

Route::get('admin/song/playlist/list', [FabworldController::class, 'songPlaylistList'])->name('admin.song.playlist.list');
Route::post('admin/song/playlist/store', [FabworldController::class, 'songPlaylistSave'])->name('admin.song.playlist.save');
Route::get('admin/song/playlist/create', [FabworldController::class, 'songPlaylistForm'])->name('admin.song.playlist.create');
Route::get('admin/song/playlist/edit/{id}', [FabworldController::class, 'songPlaylistForm'])->name('admin.song.playlist.edit');
Route::delete('admin/song/playlist/destroy/{id}', [FabworldController::class, 'songPlaylistDestroy'])->name('admin.song.playlist.destroy');

Route::get('admin/song/artist/list', [FabworldController::class, 'songArtistList'])->name('admin.song.artist.list');
Route::post('admin/song/artist/store', [FabworldController::class, 'songArtistSave'])->name('admin.song.artist.save');
Route::get('admin/song/artist/create', [FabworldController::class, 'songArtistForm'])->name('admin.song.artist.create');
Route::get('admin/song/artist/edit/{id}', [FabworldController::class, 'songArtistForm'])->name('admin.song.artist.edit');
Route::delete('admin/song/artist/destroy/{id}', [FabworldController::class, 'songArtistDestroy'])->name('admin.song.artist.destroy');