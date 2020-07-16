<script>
  import { onMount } from "svelte";
  import { createRendererProcessStateAware } from "../rendererProcessStore";
  import { emulatorSetZoomAction } from "../../shared/state/redux-emulator-state";
  import { getSpectrumEngine } from "../spectrum-loader";
  import { pcKeyNames, currentKeyMappings } from "../spectrum/KeyMapping";

  const stateAware = createRendererProcessStateAware("emulatorPanelState");
  let spectrum;
  let frameCount = 0;

  let width = 0;
  let height = 0;

  let canvasWidth;
  let canvasHeight;

  let screen;
  let shadowScreen;

  let clientWidth;
  let clientHeight;
  let emulatorStyle;

  onMount(async () => {
    spectrum = await getSpectrumEngine();
    spectrum.screenRefreshed.on(onScreenRefreshed);
    width = spectrum.screenWidth;
    height = spectrum.screenHeight;
    calculateDimensions(clientWidth, clientHeight, width, height);
    configureScreen();
    configureSound();
  });

  // --- Respond to panel size changes
  $: {
    calculateDimensions(clientWidth, clientHeight, width, height);
  }

  let imageBuffer;
  let imageBuffer8;
  let pixelData;

  function configureScreen() {
    const dataLen = width * height * 4;
    imageBuffer = new ArrayBuffer(dataLen);
    imageBuffer8 = new Uint8Array(imageBuffer);
    pixelData = new Uint32Array(imageBuffer);
  }

  function configureSound() {
    const audioCtx = new AudioContext();
    const sampleRate = audioCtx.sampleRate;
    audioCtx.close();
    spectrum.setAudioSampleRate(sampleRate);
  }

  function calculateDimensions(clientWidth, clientHeight, width, height) {
    let widthRatio = Math.floor(clientWidth / width);
    if (widthRatio < 1) widthRatio = 1;
    let heightRatio = Math.floor(clientHeight / height);
    if (heightRatio < 1) heightRatio = 1;
    const ratio = Math.min(widthRatio, heightRatio);
    stateAware.dispatch(emulatorSetZoomAction(ratio)());
    canvasWidth = width * ratio;
    canvasHeight = height * ratio;
    emulatorStyle = `width:${canvasWidth}px; height:${canvasHeight}px`;

    if (!shadowScreen || !screen) return;
    shadowScreen.width = width;
    shadowScreen.height = height;
    const shadowCtx = shadowScreen.getContext("2d");
    if (shadowCtx) {
      shadowCtx.canvas.width = width;
      shadowCtx.canvas.height = height;
    }
    const screenCtx = screen.getContext("2d");
    if (screenCtx) {
      screenCtx.canvas.width = width * ratio;
      screenCtx.canvas.height = height * ratio;
    }
  }

  function onScreenRefreshed() {
    frameCount++;
    displayScreenData();
  }

  function displayScreenData() {
    const shadowCtx = shadowScreen.getContext("2d");
    if (!shadowCtx) return;
    const shadowImageData = shadowCtx.getImageData(
      0,
      0,
      shadowScreen.width,
      shadowScreen.height
    );
    const screenCtx = screen.getContext("2d");
    let j = 0;

    const screenData = spectrum.getScreenData();
    for (let i = 0; i < width * height; i++) {
      pixelData[j++] = screenData[i];
    }
    shadowImageData.data.set(imageBuffer8);
    shadowCtx.putImageData(shadowImageData, 0, 0);
    if (screenCtx) {
      screenCtx.imageSmoothingEnabled = false;
      screenCtx.drawImage(shadowScreen, 0, 0, screen.width, screen.height);
    }
  }

  function handleKey(e, status) {
    console.log(`key: ${e.code}`);
    const key = pcKeyNames.get(e.code);
    if (!key) return;
    const mapping = currentKeyMappings.get(key);
    if (mapping) {
      console.log(`mapping: ${JSON.stringify(mapping)}`);
      spectrum.setKeyStatus(mapping.zxPrimary, status);  
      if (mapping.zxSecondary) {
        spectrum.setKeyStatus(mapping.zxSecondary, status);  
      }
    }
  }
</script>

<style>
  .emulator-panel {
    display: flex;
    overflow: hidden;
    flex-shrink: 1;
    flex-grow: 1;
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
    background-color: yellow;
  }
</style>

<svelte:window
  on:keydown={e => {
    handleKey(e, true);
    //console.log(`keydown: ${e.code}`);
  }}
  on:keyup={e => {
    handleKey(e, false);
    //console.log(`keyup: ${e.code}`);
  }} />
<div tabindex="-1" class="emulator-panel" bind:clientWidth bind:clientHeight>
  <div class="emulator-screen" style={emulatorStyle}>
    <canvas bind:this={screen} />
    <canvas bind:this={shadowScreen} style="display:none" />
  </div>
</div>
