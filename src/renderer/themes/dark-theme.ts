import { ITheme } from "./theme-core";

/**
 * This constant value defins the propertief of the 'dark' theme.
 */
export const darkTheme: ITheme = {
  name: "dark",
  properties: {
    "--shell-canvas-background-color": "#1E1E1E",
    "--toolbar-background-color": "#252525",
    "--toolbar-button-fill": "white",
    "--toolbar-button-disabled-fill": "#585858",
    "--toolbar-separator": "2px solid #686868",
    "--statusbar-background-color": "#007acc"
  },
};
