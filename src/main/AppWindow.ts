import * as path from "path";
import {
  __DARWIN__,
  __WIN32__,
  __LINUX__,
  __DEV__,
} from "./utils/electron-utils";
import {
  BrowserWindow,
  app,
  Menu,
  MenuItemConstructorOptions,
  MenuItem,
} from "electron";

/**
 * Stores a reference to the lazily loaded `electron-window-state` package.
 */
let windowStateKeeper: any | null = null;

/**
 * Minimum application window dimesnions
 */
const MIN_WIDTH = 960;
const MIN_HEIGHT = 660;

/**
 * This class encapsulates the functionality of the application's window
 * at the main process side.
 */
export class AppWindow {
  /**
   * Now, we allow only a singleton instance
   */
  static instance: AppWindow;

  // --- The associated BrowserWindow instance
  private _window: BrowserWindow | null;

  // ==========================================================================
  // Lifecycle methods

  /**
   * Instantiates the browser window
   */
  constructor() {
    // --- Store the reference to the singleton instance
    AppWindow.instance = this;

    // --- Setup the state keeper module
    if (!windowStateKeeper) {
      windowStateKeeper = require("electron-window-state");
    }

    // --- Restore the last window state
    const savedWindowState = windowStateKeeper({
      defaultWidth: MIN_WIDTH,
      defaultHeight: MIN_HEIGHT,
    });

    // --- Prepare the configuration options for the app window
    const windowOptions: Electron.BrowserWindowConstructorOptions = {
      x: savedWindowState.x,
      y: savedWindowState.y,
      width: savedWindowState.width,
      height: savedWindowState.height,
      minWidth: MIN_WIDTH,
      minHeight: MIN_HEIGHT,
      show: true,
      // --- This fixes subpixel aliasing on Windows
      // --- See https://github.com/atom/atom/commit/683bef5b9d133cb194b476938c77cc07fd05b972
      backgroundColor: "#fff",
      webPreferences: {
        webSecurity: false,
        devTools: process.env.NODE_ENV === "production" ? false : true,
        nodeIntegration: true,
      },
      acceptFirstMouse: true,
      icon: path.join(__dirname, "icons/spectnet-logo.png"),
    };

    // --- Additional options depending on the host platform
    if (__DARWIN__) {
      windowOptions.titleBarStyle = "hidden";
    } else if (__WIN32__) {
      windowOptions.frame = true;
    } else if (__LINUX__) {
      windowOptions.icon = path.join(__dirname, "static", "icon-logo.png");
    }

    this._window = new BrowserWindow(windowOptions);

    // --- Set up main window events
    this._window.on("focus", () => {
      // TODO: Handle focus event
    });
    this._window.on("blur", () => {
      // TODO: Handle blur event
    });
    this.window.on("enter-full-screen", () => {
      // TODO: Implement this
    });

    // So this is a bit of a hack. If we call window.isFullScreen directly after
    // receiving the leave-full-screen event it'll return true which isn't what
    // we're after. So we'll say that we're transitioning to 'normal' even though
    // we might be maximized. This works because electron will emit a 'maximized'
    // event after 'leave-full-screen' if the state prior to full-screen was maximized.
    this.window.on("leave-full-screen", () => {
      // TODO: Handle this event
    });
    this.window.on("maximize", () => {
      // TODO: Handle this event
    });
    this.window.on("minimize", () => {
      // TODO: Handle this event
    });
    this.window.on("unmaximize", () => {
      // TODO: Handle this event
    });
    this.window.on("restore", () => {
      // TODO: Handle this event
    });
    this.window.on("hide", () => {
      // TODO: Implement this
    });
    this.window.on("show", () => {
      // TODO: Handle this event
    });

    // --- Allow the `electron-windows-state` package to follow and save the
    // --- app window's state
    savedWindowState.manage(this._window);
  }

  /**
   * Gets the associated BrowserWindow
   */
  get window(): BrowserWindow | null {
    return this._window;
  }

  /**
   * Loads the contenst of the main window
   */
  load(): void {
    let watcher: any;
    if (__DEV__) {
      // --- Indev mode, setup hot reload
      const fileToWatch = path.join(__dirname, "./renderer.bundle.js");
      watcher = require("chokidar").watch(fileToWatch, { ignoreInitial: true });
      watcher.on("change", () => this._window.reload());
    }

    this._window.on("closed", () => {
      // --- Release resources
      this._window = null;
      if (watcher) {
        watcher.close();
      }
    });

    // --- Load the main file
    this._window.loadFile(path.join(__dirname, "index.html"));
  }

  setupMenu(): void {
    const template: (MenuItemConstructorOptions | MenuItem)[] = [];
    if (__DARWIN__) {
      template.push({
        label: app.name,
        submenu: [
          { role: "about" },
          { type: "separator" },
          { role: "services" },
          { type: "separator" },
          { role: "hide" },
          { role: "hideOthers" },
          { role: "unhide" },
          { type: "separator" },
          { role: "quit" },
        ],
      });
    }
    template.push(
      {
        label: "File",
        submenu: [__DARWIN__ ? { role: "close" } : { role: "quit" }],
      },

      {
        label: "View",
        submenu: [
          { role: "reload" },
          { role: "forceReload" },
          { role: "toggleDevTools" },
          { type: "separator" },
          { role: "resetZoom" },
          { role: "zoomIn" },
          { role: "zoomOut" },
          { type: "separator" },
          { role: "togglefullscreen" },
        ],
      }
    );
    if (__DARWIN__) {
      template.push({
        label: "Window",
        submenu: [
          { role: "minimize" },
          { role: "zoom" },
          { type: "separator" },
          { role: "front" },
          { type: "separator" },
          { role: "window" },
        ],
      });
    }
    template.push({
      role: "help",
      submenu: [
        {
          label: "Learn More",
          click: async () => {
            const { shell } = require("electron");
            await shell.openExternal("https://electronjs.org");
          },
        },
      ],
    });
    const menu = Menu.buildFromTemplate(template);
    Menu.setApplicationMenu(menu);
  }
}
