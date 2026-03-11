@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['home_page']['seo_title'])
@section('meta_description', $seo_setting['home_page']['seo_description'])

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')

<section class="position-relative text-white">
<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold">🎵 Listen to Our Songs</h2>
        <p class="text-muted">Enjoy your favorite tracks with a single click</p>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <table class="table align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th style="width: 60px;"></th>
                        <th>Title</th>
                        <th>Artist</th>
                        <th style="width: 180px;">Duration</th>
                    </tr>
                </thead>
                <tbody id="song-list">
                    @foreach ($songs as $song)
                        <tr class="song-item" data-audio="{{ asset('uploads/songs/'.$song->file) }}">
                            <td>
                                <button class="btn btn-outline-primary btn-sm play-btn">
                                    <i class="bi bi-play-fill fs-5"></i>
                                </button>
                            </td>
                            <td class="fw-semibold">{{ $song->title }}</td>
                            <td>Artist Name</td>
                            <td>{{ $song->duration ?? '--:--' }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <div class="mt-4 text-center">
        <audio id="audio-player" controls class="w-100" style="max-width:600px; display:none;">
            <source id="audio-source" src="" type="audio/mpeg">
            Your browser does not support the audio element.
        </audio>
    </div>
</div>
</section>


<script>

document.addEventListener('DOMContentLoaded', function () {
    const audioPlayer = document.getElementById('audio-player');
    const audioSource = document.getElementById('audio-source');
    let currentBtn = null;

    document.querySelectorAll('.play-btn').forEach(btn => {
        btn.addEventListener('click', function () {
            const row = this.closest('.song-item');
            const songUrl = row.getAttribute('data-audio');

            // If same song clicked again
            if (currentBtn === this && !audioPlayer.paused) {
                audioPlayer.pause();
                this.innerHTML = '<i class="bi bi-play-fill fs-5"></i>';
                return;
            }

            // Stop previous
            if (currentBtn) {
                currentBtn.innerHTML = '<i class="bi bi-play-fill fs-5"></i>';
            }

            // Change icon to pause
            this.innerHTML = '<i class="bi bi-pause-fill fs-5"></i>';
            currentBtn = this;

            // Play selected song
            audioSource.src = songUrl;
            audioPlayer.load();
            audioPlayer.play();
            audioPlayer.style.display = 'block';
        });
    });

    // When song ends
    audioPlayer.addEventListener('ended', function () {
        if (currentBtn) {
            currentBtn.innerHTML = '<i class="bi bi-play-fill fs-5"></i>';
        }
    });
});
</script>
@endsection
@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection
