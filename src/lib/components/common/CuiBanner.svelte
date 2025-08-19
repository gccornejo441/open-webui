<script lang="ts">
  export let level: 'UNCLASSIFIED' | 'CUI' | 'CONFIDENTIAL' | 'SECRET' = 'CUI';

  const bannerColors: Record<string, string> = {
    'UNCLASSIFIED': 'banner-unclassified',
    'CUI': 'cui-banner-cui',
    'CONFIDENTIAL': 'banner-confidential',
    'SECRET': 'banner-secret',
  };

  const bannerText = level.toUpperCase();
</script>

<style>
.cui-banner {
  position: relative;
  z-index: 1000;
  text-align: center;
  font-weight: bold;
  font-size: 1rem;
  letter-spacing: 0.1em;
  height: 1.5rem;
  line-height: 1.5rem;
  padding: 0;

}

.banner-unclassified {
  background-color: #047857;
}
.banner-confidential {
  background-color: #1d4ed8;
}
.banner-secret {
  background-color: #dc2626;
}

.cui-banner-cui {
  background-color: #dce2cf;
  border: 1px solid #5b5f3c;
}

@media (prefers-color-scheme: dark) {
  .cui-banner-cui {
    background-color: transparent;
    border: 0;
  }
}
</style>

<!-- TOP Banner -->
<div class="cui-banner cui-banner-top dark:text-[#aab78a] text-[#17180f]- {bannerColors[level]}">
  {bannerText}
</div>

<slot />
