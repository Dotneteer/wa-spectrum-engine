/**
 * Represents the location of an address
 */
export class AddressLocation {
  isInRom: boolean;
  index: number;
  address: number;
}

/**
 * Represents information about a paged bank
 */
export class PagedBank {
  isPagedIn: boolean;
  baseAddress: number;
}
