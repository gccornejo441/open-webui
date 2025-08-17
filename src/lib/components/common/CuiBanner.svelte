<script lang="ts">
  export let level: 'UNCLASSIFIED' | 'CUI' | 'CONFIDENTIAL' | 'SECRET' | 'TOP SECRET' = 'CUI';

  const bannerColors: Record<string, string> = {
    'UNCLASSIFIED': 'bg-green-700 text-white',
    'CUI': 'cui-banner-cui',
    'CONFIDENTIAL': 'bg-blue-700 text-white',
    'SECRET': 'bg-red-600 text-white',
    'TOP SECRET': 'bg-orange-600 text-black',
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

.cui-banner-top {
  top: 0;
}

.cui-banner-bottom {
  bottom: 0;
}

.cui-banner-spacer {
  height: 1.5rem;
}

/* === Military green colors for CUI === */

/* Light mode */
.cui-banner-cui {
  background-color: #dce2cf;
  border: 1px solid #5b5f3c;
  color: #3e4229;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .cui-banner-cui {
    background-color: transparent;
    border: 0px;
    color: #aab78a;
  }
}
</style>

<!-- TOP Banner -->
<div class="cui-banner cui-banner-top {bannerColors[level]}">
  {bannerText}
</div>

<slot />
