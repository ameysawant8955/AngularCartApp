import { Component, OnInit,Output, EventEmitter,Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { of, Observable } from 'rxjs';
import { DataserviceService } from '../dataservice.service';

@Component({
  selector: 'app-product-data',
  templateUrl: './products.component.html'
})

export class ProductsComponent {
  @Output() ToCart = new EventEmitter<number>();
  products: Product[];
  public TotalCount: number;
  constructor(http: HttpClient, @Inject('BASE_URL') baseUrl: string, private dataService: DataserviceService) {
    http.get<Product[]>(baseUrl + 'product').subscribe(result => {
      this.products = result;
      this.products.forEach((p) => {
        p.count = 0;
      });
    }, error => console.error(error));
  }

  add(product: Product) {
    this.updateCart(product);
  }

  updateCart(product: Product) {
    this.dataService.setCountValue(product);
  }
}

export interface Product {
  productId: number;
  productName: string;
  productImageUrl: string;
  productCost: number;
  categoryName: string;
  deliveryCharges: number;
  discounts: Discount[];
  totalDiscount: number;
  count: number;
  totalPriceToPay: number;
}

export interface Discount {
  discount: number;
  discountName: string;
}
