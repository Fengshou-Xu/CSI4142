CREATE TABLE public.Date_Dimension (
    date_id SERIAL PRIMARY KEY,
    datetime TIMESTAMP,
    weekday varchar,
    is_holiday BOOLEAN,
    holiday_name VARCHAR(255)
);


CREATE TABLE public.Branch_Dimension (
    branch_id SERIAL PRIMARY KEY,
    branch VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE public.Customer_Dimension (
    customer_id SERIAL PRIMARY KEY,
    customer_type VARCHAR(255),
    gender VARCHAR(255)
);


CREATE TABLE public.Payment_Dimension (
    payment_id SERIAL PRIMARY KEY,
    payment_method VARCHAR(255)
);

CREATE TABLE public.Product_Dimension (
    product_id SERIAL PRIMARY KEY,
    product_line VARCHAR(255),
    brand VARCHAR(255),
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);


CREATE TABLE public.Sales_Fact_Table (
    sales_fact_id SERIAL PRIMARY KEY,
    invoice_id VARCHAR,
    date_id INTEGER,
    customer_id INTEGER,
    product_id INTEGER,
    branch_id INTEGER,
    payment_id INTEGER,
    quantity INTEGER,
    tax_5_percent DECIMAL(10, 2),
    total_sales DECIMAL(10, 2),
    total_category VARCHAR(255),
    quantity_category VARCHAR(255),
    cogs_category VARCHAR(255),
    gross_income_category VARCHAR(255),
    rating_category VARCHAR(255),
    gross_margin_percentage_category VARCHAR(255),
    cogs DECIMAL(10, 2),
    gross_margin_percentage DECIMAL(5, 2),
    gross_income DECIMAL(10, 2),
    rating DECIMAL(3, 1),
    FOREIGN KEY (date_id) REFERENCES public.Date_Dimension(date_id),
    FOREIGN KEY (customer_id) REFERENCES public.Customer_Dimension(customer_id),
    FOREIGN KEY (product_id) REFERENCES public.Product_Dimension(product_id),
    FOREIGN KEY (branch_id) REFERENCES public.Branch_Dimension(branch_id),
    FOREIGN KEY (payment_id) REFERENCES public.Payment_Dimension(payment_id)
);