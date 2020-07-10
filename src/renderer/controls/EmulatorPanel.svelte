<script>
  let screen;
  let shadowScreen;
</script>
<style>
  .emulator-panel {
    display: flex;
    overflow: hidden;
    flex-shrink: 1;
    height: 100%;
    width: 100%;
    padding: 8px 12px;
    background-color: var(--emulator-background-color);
    box-sizing: border-box;
    align-content: start;
    justify-items: start;
    justify-content: center;
    align-items: center;
  }

  .emulator-screen {
    width: 100px;
    height: 300px;
    background-color: yellow;
  }
</style>

<div class="emulator-panel">
  <div class="emulator-screen">
    <canvas bind:this={screen} />
    <canvas bind:this={shadowScreen} style="display:none" />
  </div>
</div>