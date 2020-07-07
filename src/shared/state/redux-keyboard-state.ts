import { SpectNetAction, createAction } from "./redux-core";

export const keyboardShowAction = createAction("KEYBOARD_SHOW");
export const keyboardHideAction = createAction("KEYBOARD_HIDE");

/**
 * This reducer manages keyboard panel state changes
 * @param state Input state
 * @param action Action executed
 */
export function keyboardStateReducer(
  state: boolean = false,
  { type }: SpectNetAction
): boolean {
  switch (type) {
    case "KEYBOARD_SHOW":
      return true;
    case "KEYBOARD_HIDE":
      return false;
  }
  return state;
}