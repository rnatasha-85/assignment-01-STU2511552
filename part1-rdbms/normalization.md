## Anomaly Analysis

### Insert Anomaly Example:
The data in the column office_address is inconsistent for sales_rep_name = "Deepak Joshi". For some rows the office address is "Mumbai HQ, Nariman Point, Mumbai - 400021" while for some it is "Mumbai HQ, Nariman Pt, Mumbai - 400021". As the inserted data in the column office_address in not consistent, it is an insert anomaly. An insert anonmaly will also happen if a new product is added that does not have an order or if a new customer is added who has not yet placed any order.

### Update Anomaly Example:
The information in the columns customer_name,customer_email,customer_city, product_name, category,unit_price,sales_rep_name,sales_rep_email,office_address are repeated in multiple rows and hence resulting in update anomaly.

### Delete Anomaly Example:
Deleting the row with order_id = ORD1185, removes the details of the product "Webcam" completely from the table i.e. the information of the cells product_id = P008, product_name = "Webcam" are lost after deleting the row. Hence it is a delete anomaly.

## Normalization Justification
Although using a single table may appear simpler, it leads to significant redundancy and rework if the data changes in the future.
For example, consider a customer with customer_id = 'C003'. If the customer’s email ID changes, we would need to update it manually in 21 different places within the table. In contrast, if the data were normalized, the initial setup might take a couple of hours, but any future update would need to be made in only one place.
Similarly, if the customer changes their city, the single-table structure would require updating the city in 21 places, whereas in a normalized structure, it would need to be updated just once. Thus, normalization reduces repetitive manual updates and minimizes the risk of data inconsistencies that can arise if any row is missed during updates.

Additionally, consider a scenario where the company launches 2–3 new products that have not yet received any orders. If we add these products to the current single table, many cells will contain blank values, making it unclear whether the data is missing or simply not yet available. There is no effective way to distinguish between the two cases.
On the other hand, if we choose not to include these new products in the table until orders are placed, we lose visibility and record of the new products altogether.

