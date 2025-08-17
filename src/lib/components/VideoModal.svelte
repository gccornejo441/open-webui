<!-- VideoModal.svelte (YouTube-only, minimal) -->
<script lang="ts">
	import Modal from "./common/Modal.svelte";


  export let show = false;
  export let title = 'Welcome video';
  /** Accepts either a full YouTube URL or just the video ID */
  export let youtube: string;

  /** Optional params */
  export let size: 'sm' | 'md' | 'lg' | 'xl' | '2xl' | 'full' = 'xl';
  export let autoplay = true;
  export let controls = true;
  export let muted = false;

  let iframeSrc = '';

  function getYouTubeId(input: string): string {
    // If it's already an ID, return as-is (simple heuristic: no slashes + short)
    if (/^[a-zA-Z0-9_-]{8,15}$/.test(input)) return input;

    // Try common URL formats
    const m1 = input.match(/[?&]v=([^?&#]+)/);
    if (m1) return m1[1];
    const m2 = input.match(/youtu\.be\/([^?&#]+)/);
    if (m2) return m2[1];
    const m3 = input.match(/youtube\.com\/embed\/([^?&#]+)/);
    if (m3) return m3[1];

    return input; // fallback
  }

  function buildEmbedSrc(id: string): string {
    const params = new URLSearchParams({
      autoplay: autoplay ? '1' : '0',
      controls: controls ? '1' : '0',
      mute: muted ? '1' : '0',
      modestbranding: '1',
      rel: '0',
      playsinline: '1'
    }).toString();
    return `https://www.youtube.com/embed/${id}?${params}`;
  }

  // Update iframe src whenever modal opens or inputs change
  $: if (show && youtube) {
    iframeSrc = buildEmbedSrc(getYouTubeId(youtube));
  }

  // When modal closes, clear src to stop playback
  $: if (!show) {
    iframeSrc = '';
  }

  function close() {
    show = false;
  }
</script>

{#if show}
  <Modal bind:show size={size} className="bg-black rounded-2xl">
    <div class="p-2">
      <div class="flex items-center justify-between mb-2">
        <h2 id="welcome-video-title" class="text-sm font-medium text-white">
          {title}
        </h2>
        <button
          class="p-1 rounded-md focus:outline-none focus:ring"
          aria-label="Close video"
          on:click={close}
        >
          ✕
        </button>
      </div>

      <div class="relative w-full aspect-video">
        {#if iframeSrc}
          <iframe
            title={title}
            src={iframeSrc}
            class="w-full h-full rounded-xl"
            frameborder="0"
            allow="autoplay; fullscreen; picture-in-picture"
            allowfullscreen
          />
        {/if}
      </div>
    </div>
  </Modal>
{/if}
