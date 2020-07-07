import { WindowState } from "./redux-window-state";

/**
 * Represents the state of the application
 */
export interface AppState {
  /**
   * Does the app has the focus?
   */
  appHasFocus?: boolean;

  /**
   * Is the keyboard panel visible?
   */
  keyboardVisible?: boolean;
}

