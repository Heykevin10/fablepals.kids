@extends('frontend.layouts.master')

@section('meta_title', $seo_setting['shop_page']['seo_title'])
@section('meta_description', $seo_setting['shop_page']['seo_description'])
@push('custom_meta')
    <meta property="og:title" content="{{ $seo_setting['shop_page']['seo_title'] }}" />
    <meta property="og:description" content="{{ $seo_setting['shop_page']['seo_description'] }}" />
    <meta property="og:image" content="{{ asset($setting?->shop_page_breadcrumb_image) }}" />
    <meta property="og:URL" content="{{ url()->current() }}" />
    <meta property="og:type" content="website" />
@endpush

@section('header')
    @include('frontend.layouts.header-layout.two')
@endsection

@section('contents')
    <!-- Breadcumb 
    <x-breadcrumb :image="$setting?->shop_page_breadcrumb_image" :title="__('Songs')" />-->

	<style>
        :root {
            --primary-color: #6c5ce7;
            --dark-bg: #121212;
            --card-bg: #1e1e1e;
            --text-primary: #ffffff;
            --text-secondary: #b3b3b3;
        }

        body {
            background-color: var(--dark-bg);
            color: var(--text-primary);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .music-player-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        .section-title {
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
            font-weight: 600;
        }

        .song-card {
            background-color: var(--card-bg);
            border-radius: 8px;
            transition: all 0.3s ease;
            margin-bottom: 1rem;
            border: none;
            overflow: hidden;
        }

        .song-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        .song-card.active {
            box-shadow: 0 0 21px var(--primary-color);
        }

        .song-info {
            padding: 1rem;
        }

        .song-title {
            font-weight: 600;
            margin-bottom: 0.25rem;
            color: var(--text-primary);
        }

        .song-artist {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .song-duration {
            color: var(--text-secondary);
            font-size: 0.85rem;
        }

        .play-btn {
            background-color: var(--primary-color);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s ease;
        }

        .play-btn:hover {
            transform: scale(1.1);
            background-color: #5b4bd4;
        }

        .player-container {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(30, 30, 30, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            z-index: 1000;
        }

        .player-controls {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
        }

        .current-song-info {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex: 1;
        }

        .song-thumbnail {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            background-color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .progress-container {
            flex: 2;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .progress-bar {
            width: 100%;
            height: 6px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 3px;
            margin-bottom: 0.5rem;
            cursor: pointer;
        }

        .progress {
            height: 100%;
            background-color: var(--primary-color);
            border-radius: 3px;
            width: 0%;
        }

        .time-info {
            display: flex;
            justify-content: space-between;
            width: 100%;
            font-size: 0.8rem;
            color: var(--text-secondary);
        }

        .control-buttons {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex: 1;
            justify-content: flex-end;
        }

        .control-btn {
            background: none;
            border: none;
            color: var(--text-primary);
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .control-btn:hover {
            color: var(--primary-color);
        }

        .play-pause-btn {
            background-color: var(--primary-color);
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .volume-control {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .volume-slider {
            width: 100px;
        }

      @media (max-width: 768px) {

    .player-controls {
        flex-direction: column;
        align-items: center;
        text-align: center;
    }

    .current-song-info {
        justify-content: center;
        text-align: center;
    }

    .progress-container {
        width: 100%;
        align-items: center;
    }

    .control-buttons {
        width: 100%;
        justify-content: center !important;
        margin-top: 10px;
        gap: 15px;
    }

    .volume-control {
        justify-content: center;
    }
}
            
            .current-song-info, .progress-container, .control-buttons {
                width: 100%;
            }
            
            .volume-control {
                display: none;
            }
        }

        .search-box {
            background-color: #ffffff;
            border: none;
            color: var(--text-primary);
            padding: 0.75rem 1rem;
            border-radius: 50px;
            margin-bottom: 2rem;
        }

        .search-box:focus {
            box-shadow: 0 0 0 2px var(--primary-color);
			background: #ffffff;
        }
		input::placeholder {
		  color: #fff!important;
		}
		input{
			background: #181a1b!important;
			border: 1px solid #333!important;
			color: #ffffff!important;
		}
		/* ===== Footer newsletter input: make it like 2nd image (white + underline) ===== */
footer input[type="email"],
footer .form-control[type="email"],
footer .newsletter-form input,
footer .footer-wrapper input {
  background: transparent !important;
  border: 0 !important;
  border-bottom: 1px solid #000 !important;
  color: #000 !important;
  border-radius: 0 !important;
  padding: 10px 0 !important;
  box-shadow: none !important;
}

/* footer placeholder black/gray */
footer input[type="email"]::placeholder,
footer .form-control[type="email"]::placeholder,
footer .newsletter-form input::placeholder,
footer .footer-wrapper input::placeholder {
  color: #777 !important;
}

/* footer button/icon (paper plane) black */
footer button,
footer .newsletter-form button,
footer .footer-wrapper button,
footer .newsletter-form i,
footer button i {
  color: #000 !important;
}

/* focus effect */
footer input[type="email"]:focus,
footer .form-control[type="email"]:focus {
  outline: none !important;
  box-shadow: none !important;
  border-bottom-color: #000 !important;
}
		select.form-select {
			background: #181a1b;
			color: #fff;
			border: 1px solid #333;
		}

		select.form-select option {
			color: #181a1b;          /* Text color for options */
			background: #fff;        /* Background for options */
		}

		/* For the selected item (when closed) */
		select.form-select:focus, 
		select.form-select:active, 
		select.form-select option:checked {
			color: #ff0;             /* Selected text color (bright for contrast) */
			background: #181a1b;     /* Black/dark background */
		}
		.song-card .play-btn > i {
  width: 129px !important;
  height: 38px;
  line-height: 38px;
  max-width: 100px !important;
  font-size: 16px;
}
    </style>
	
    <!-- Main Area -->
    <section class="shop__area space top-baseline">
        <div class="container pt-5">
            <main class="music-player-container">
				<div class="filter-bar row mb-4 align-items-end p-3 bg-dark rounded">
					<div class="col-md-12 mb-2">
						<input type="text" id="search-box" class="form-control" placeholder="Search by title or artist...">
					</div>
				</div>

				<div class="row" id="songs-list">
					<!-- Songs will be dynamically loaded here -->
				</div>
			</main>

			<!-- Audio Player -->
			<div class="player-container" id="player-container">
				<div class="player-controls">
					<div class="current-song-info">
						<div class="song-thumbnail">
							<i class="fas fa-music"></i>
						</div>
						<div>
							<div class="song-title" id="current-song-title">Select a song to play</div>
							<div class="song-artist" id="current-song-artist">-</div>
						</div>
					</div>

					<div class="progress-container">
						<div class="progress-bar" id="progress-bar">
							<div class="progress" id="progress"></div>
						</div>
						<div class="time-info">
							<span id="current-time">0:00</span>
							<span id="duration">0:00</span>
						</div>
					</div>

					<div class="control-buttons">
						<button class="control-btn" id="shuffle-btn">
							<i class="fas fa-random"></i>
						</button>
						<button class="control-btn" id="prev-btn">
							<i class="fas fa-step-backward"></i>
						</button>
						<button class="control-btn play-pause-btn" id="play-pause-btn">
							<i class="fas fa-play"></i>
						</button>
						<button class="control-btn" id="next-btn">
							<i class="fas fa-step-forward"></i>
						</button>
						<button class="control-btn" id="repeat-btn">
							<i class="fas fa-redo"></i>
						</button>
						<div class="volume-control">
							<button class="control-btn" id="volume-btn">
								<i class="fas fa-volume-up"></i>
							</button>
							<input type="range" class="form-range volume-slider" id="volume-slider" min="0" max="100" value="80">
						</div>
					</div>
				</div>
			</div>

			<!-- Audio element -->
			<audio id="audio-player"></audio>
        </div>
    </section>


    <!--  Marquee Area -->
    @include('frontend.partials.marquee')

@endsection

@section('footer')
    @include('frontend.layouts.footer-layout.two')
@endsection

@push('js')

	
<script>
// Inject songs from backend safely into JS array

const songs = @json($songs);

$(document).ready(function() {
    let currentSongIndex = 0,
        isPlaying = false,
        isShuffled = false,
        isRepeating = false;

    const $songsList = $('#songs-list'),
        $audioPlayer = $('#audio-player')[0],
        $currentSongTitle = $('#current-song-title'),
        $currentSongArtist = $('#current-song-artist'),
        $playPauseBtn = $('#play-pause-btn'),
        $prevBtn = $('#prev-btn'),
        $nextBtn = $('#next-btn'),
        $progressBar = $('#progress-bar'),
        $progress = $('#progress'),
        $currentTimeEl = $('#current-time'),
        $durationEl = $('#duration'),
        $volumeSlider = $('#volume-slider'),
        $volumeBtn = $('#volume-btn'),
        $shuffleBtn = $('#shuffle-btn'),
        $repeatBtn = $('#repeat-btn'),
        $searchBox = $('#search-box');

    function renderSongsList(filteredSongs = songs) {
        $songsList.empty();
        $.each(filteredSongs, function(i, song) {
            let isActive = (songs[currentSongIndex] && song.id === songs[currentSongIndex].id) && isPlaying;
            let activeClass = isActive ? 'active' : '';
            let iconClass = isActive ? 'fa-pause' : 'fa-play';

            $songsList.append(`
                <div class="col-md-6 col-lg-4">
                    <div class="song-card ${activeClass}" data-index="${i}">
                        <div class="d-flex align-items-center p-3">
                            <button class="play-btn me-3" data-index="${i}">
                                <i class="fas ${iconClass}"></i>
                            </button>
                            <div class="song-info flex-grow-1">
                                <div class="song-title">${song.title}</div>
                                <div class="song-artist">${song.artist}</div>
                            </div>
                            <div class="song-duration">${song.duration}</div>
                        </div>
                    </div>
                </div>
            `);
        });
    }

    function playSong(index) {
        const filteredSongs = getFilteredSongs();
        if (index < 0 || index >= filteredSongs.length) return;

        let songToPlay = filteredSongs[index];
        currentSongIndex = songs.findIndex(s => s.id === songToPlay.id);
        if (currentSongIndex === -1) currentSongIndex = 0;

        let song = songs[currentSongIndex];
        $audioPlayer.src = song.src;
        $audioPlayer.currentTime = 0;
        $audioPlayer.play();

        $currentSongTitle.text(song.title);
        $currentSongArtist.text(song.artist);
        isPlaying = true;

        updatePlayPauseButton();
        renderSongsList(filteredSongs);
    }

    function togglePlayPause() {
        if (!$audioPlayer.src) {
            playSong(0);
            return;
        }

        if (isPlaying) {
            $audioPlayer.pause();
        } else {
            $audioPlayer.play();
        }
    }

    function updatePlayPauseButton() {
        $playPauseBtn.find('i').attr('class', isPlaying ? 'fas fa-pause' : 'fas fa-play');
    }

    function getFilteredSongs() {
        let keyword = $searchBox.val().toLowerCase().trim();
        if (!keyword) return songs;

        return songs.filter(song =>
            (song.title && song.title.toLowerCase().includes(keyword)) ||
            (song.artist && song.artist.toLowerCase().includes(keyword))
        );
    }

    function formatTime(seconds) {
        let mins = Math.floor(seconds / 60),
            secs = Math.floor(seconds % 60);
        return `${mins}:${secs < 10 ? '0' : ''}${secs}`;
    }

    function playNextSong() {
        if (isShuffled) {
            const filteredSongs = getFilteredSongs();
            if (filteredSongs.length === 0) return;
            let randomIndex = Math.floor(Math.random() * filteredSongs.length);
            playSong(randomIndex);
        } else {
            currentSongIndex = (currentSongIndex + 1) % songs.length;
            playSongByFilteredIndex(currentSongIndex);
        }
    }

    function playPreviousSong() {
        currentSongIndex = (currentSongIndex - 1 + songs.length) % songs.length;
        playSongByFilteredIndex(currentSongIndex);
    }

    function playSongByFilteredIndex(idx) {
        const filteredSongs = getFilteredSongs();
        const songId = songs[idx]?.id;
        const filteredIndex = filteredSongs.findIndex(s => s.id === songId);
        if (filteredIndex !== -1) {
            playSong(filteredIndex);
        } else if (filteredSongs.length > 0) {
            playSong(0);
        }
    }

    function updateVolumeIcon(volume) {
        let iconClass = volume === 0 ? 'fa-volume-mute' : (volume < 0.5 ? 'fa-volume-down' : 'fa-volume-up');
        $volumeBtn.find('i').attr('class', `fas ${iconClass}`);
    }

    function setupEventListeners() {
        $playPauseBtn.on('click', togglePlayPause);
        $prevBtn.on('click', playPreviousSong);
        $nextBtn.on('click', playNextSong);
        $songsList.on('click', '.play-btn', function(e) {
            e.stopPropagation();
            let index = Number($(this).data('index'));
            playSong(index);
        });
        $audioPlayer.addEventListener('play', function() {
            isPlaying = true;
            updatePlayPauseButton();
            renderSongsList(getFilteredSongs());
        });
        $audioPlayer.addEventListener('pause', function() {
            isPlaying = false;
            updatePlayPauseButton();
            renderSongsList(getFilteredSongs());
        });
        $audioPlayer.addEventListener('timeupdate', function() {
            if ($audioPlayer.duration) {
                let percent = $audioPlayer.currentTime / $audioPlayer.duration * 100;
                $progress.css('width', percent + '%');
                $currentTimeEl.text(formatTime($audioPlayer.currentTime));
                $durationEl.text(formatTime($audioPlayer.duration));
            }
        });
        $progressBar.on('click', function(e) {
            const barWidth = $(this).width(),
                offsetX = e.offsetX,
                duration = $audioPlayer.duration;
            if (duration) {
                $audioPlayer.currentTime = (offsetX / barWidth) * duration;
            }
        });
        $audioPlayer.addEventListener('ended', function() {
            if (isRepeating) {
                $audioPlayer.currentTime = 0;
                $audioPlayer.play();
            } else {
                playNextSong();
            }
        });
        $volumeSlider.on('input', function() {
            const vol = $(this).val() / 100;
            $audioPlayer.volume = vol;
            updateVolumeIcon(vol);
        });
        $volumeBtn.on('click', function() {
            if ($audioPlayer.volume > 0) {
                $audioPlayer.volume = 0;
                $volumeSlider.val(0);
            } else {
                $audioPlayer.volume = 0.8;
                $volumeSlider.val(80);
            }
            updateVolumeIcon($audioPlayer.volume);
        });
        $shuffleBtn.on('click', function() {
            isShuffled = !isShuffled;
            $(this).toggleClass('active', isShuffled);
        });
        $repeatBtn.on('click', function() {
            isRepeating = !isRepeating;
            $(this).toggleClass('active', isRepeating);
        });
        $searchBox.on('keyup', function() {
            renderSongsList(getFilteredSongs());
        });
    }

    function init() {
        if (!songs || songs.length === 0) {
            $currentSongTitle.text('No songs available');
            $currentSongArtist.text('');
            return;
        }
        renderSongsList();
        $currentSongTitle.text(songs[0].title);
        $currentSongArtist.text(songs[0].artist);
        $audioPlayer.volume = 0.8;
        $volumeSlider.val(80);
        updateVolumeIcon(0.8);
        setupEventListeners();
    }

    init();
});
</script>


	
@endpush
