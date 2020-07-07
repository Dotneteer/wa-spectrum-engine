<script>
  export let visible = true;
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
  <div class="keyboard-panel">
  </div>
{/if}