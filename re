                       Table "public.records_user"
    Column    |           Type           | Collation | Nullable | Default 
--------------+--------------------------+-----------+----------+---------
 password     | character varying(128)   |           | not null | 
 last_login   | timestamp with time zone |           |          | 
 is_superuser | boolean                  |           | not null | 
 id           | uuid                     |           | not null | 
 created_at   | timestamp with time zone |           | not null | 
 updated_at   | timestamp with time zone |           | not null | 
 email        | character varying(254)   |           | not null | 
 first_name   | character varying(30)    |           | not null | 
 last_name    | character varying(30)    |           | not null | 
 phone_number | character varying(15)    |           | not null | 
 is_active    | boolean                  |           | not null | 
 is_auth      | boolean                  |           | not null | 
 is_staff     | boolean                  |           | not null | 
Indexes:
    "records_user_pkey" PRIMARY KEY, btree (id)
    "records_user_email_key" UNIQUE CONSTRAINT, btree (email)
    "records_user_email_e58325f3_like" btree (email varchar_pattern_ops)
Referenced by:
    TABLE "django_admin_log" CONSTRAINT "django_admin_log_user_id_c564eba6_fk_records_user_id" FOREIGN KEY (user_id) REFERENCES records_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "records_kinguarantorinfo" CONSTRAINT "records_kinguarantorinfo_user_id_0d06f668_fk_records_user_id" FOREIGN KEY (user_id) REFERENCES records_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "records_record" CONSTRAINT "records_record_user_id_96fecca6_fk_records_user_id" FOREIGN KEY (user_id) REFERENCES records_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "records_rider" CONSTRAINT "records_rider_user_id_1d509d7d_fk_records_user_id" FOREIGN KEY (user_id) REFERENCES records_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "records_user_groups" CONSTRAINT "records_user_groups_user_id_b9d9aee9_fk_records_user_id" FOREIGN KEY (user_id) REFERENCES records_user(id) DEFERRABLE INITIALLY DEFERRED
    TABLE "records_user_user_permissions" CONSTRAINT "records_user_user_pe_user_id_9f19acea_fk_records_u" FOREIGN KEY (user_id) REFERENCES records_user(id) DEFERRABLE INITIALLY DEFERRED

