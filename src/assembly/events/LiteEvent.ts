/**
 * Event handler function
 */
type EventFunc = () => void;

/**
 * This class implements a simple multi-subscriber event
 */
export class LiteEvent {
  private _handlers: EventFunc[] = [];

  /**
   * Adds a new event handler
   * @param handler Handler method
   */
  public on(handler: EventFunc): void {
    this._handlers.push(handler);
  }

  /**
   * Removes the specified event handler
   * @param handler Handler method
   */
  public off(handler: EventFunc): void {
    this._handlers = this._handlers.filter((h) => h !== handler);
  }

  /**
   * Raises the event
   * @param data Event data
   */
  public trigger(): void {
    this._handlers.slice(0).forEach((h) => {h()});
  }

  /**
   * Number of handlers attached
   */
  public get handlers(): u32 {
    return this._handlers.length;
  }
}
