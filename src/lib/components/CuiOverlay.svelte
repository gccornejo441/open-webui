<script lang="ts">
  export let show: boolean = false;
  export let onAccept: () => void;

  function handleAccept() {
    onAccept();
  }
</script>

{#if show}
  <div
    class="w-full h-screen z-60 max-h-[100dvh] absolute top-0 left-0 flex items-center justify-center"
    style="background-color: rgba(0,0,0,0.8);" 
  >
    <div
      class="p-10 rounded-xl shadow-lg max-w-3xl text-center space-y-6 border"
      style="
        background-color: var(--military-light-bg);
        border-color: var(--military-light-border);
        color: var(--military-light-text);
      "
    >
      <h1
        class="text-3xl font-bold uppercase"
        style="color: var(--military-light-border);"
      >
        DOD Controlled Unclassified Information (CUI)
      </h1>

      <p class="text-base leading-relaxed">
        You are accessing a Department of Defense (DoD) information system that may contain
        Controlled Unclassified Information (CUI). Unauthorized access or use of this system is
        prohibited and may be subject to disciplinary action and/or criminal prosecution.
      </p>

      <p class="font-semibold">
        By clicking “Accept,” you acknowledge and agree to comply with all applicable
        regulations and guidance regarding the handling of CUI.
      </p>

      <div>
        <button
          class="font-semibold py-2 px-6 rounded transition"
          style="
            background-color: var(--military-dark-bg);
            color: var(--white);
            border: 1px solid var(--military-dark-border);
          "
          on:click={handleAccept}
          on:mouseover={(e) =>
            (e.currentTarget.style.backgroundColor = 'var(--military-dark-border)')
          }
          on:mouseout={(e) =>
            (e.currentTarget.style.backgroundColor = 'var(--military-dark-bg)')
          }
        >
          Accept
        </button>
      </div>
    </div>
  </div>
{/if}
