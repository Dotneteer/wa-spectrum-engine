<script>
  export let visible = true;
  export let initialHeight;
  export let sizedHeight;
</script>

<style>
  .keyboard-panel {
    display: flex;
    flex-shrink: 1;
    height: 100%;
    width: 100%;
    padding: 8px 12px;
    background-color: var(--keyboard-background-color);
    box-sizing: border-box;
    align-content: start;
    justify-items: start;
  }
</style>

{#if visible}
  <div class="keyboard-panel"
    data-initial-size={initialHeight}
    bind:clientHeight={sizedHeight}>
  </div>
{/if}