import { Injectable } from '@angular/core';
import { Product } from './products/products.component';

@Injectable({
  providedIn: 'root'
})
export class DataserviceService {
  CountValue: number;
  ProductsSelected: Product[];
  constructor() { }

  public setCountValue(product: Product) {
    if (this.ProductsSelected == null) {
      this.ProductsSelected = [];
    }
    var productFound = this.ProductsSelected.find(r => r.productId == product.productId);
    if (productFound != null) {
      productFound.count++;
    }
    else {
      product.count++;
      this.ProductsSelected.push(product);
    }

    if (this.ProductsSelected != null) {
      var found = this.ProductsSelected.filter(r => r.count > 0);
      this.CountValue = found.length;
    }
    else {
      this.CountValue = 0;
    }

    console.log(this.ProductsSelected);
  }
  public getCountValue(): number {
    return this.CountValue;
  }
  public setCounterValue(val: number) {
    this.CountValue = val;
  }
  public getProductsSelectedValue(): Product[] {
    return this.ProductsSelected;
  }
}
