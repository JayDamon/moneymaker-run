INSERT INTO USER_ENTITY (ID,EMAIL,EMAIL_CONSTRAINT,EMAIL_VERIFIED,ENABLED,FEDERATION_LINK,FIRST_NAME,LAST_NAME,REALM_ID,USERNAME,CREATED_TIMESTAMP,SERVICE_ACCOUNT_CLIENT_LINK,NOT_BEFORE) VALUES
    ('5809b48e-b705-4b3e-be9f-16ce0380cb45',NULL,'dcf40d35-8a2a-42dd-bc0f-2602fc5763ef',false,true,NULL,'Jays','Test','moneymaker','test',1644101256130,NULL,0);

INSERT INTO public.credential
(id, salt, "type", user_id, created_date, user_label, secret_data, credential_data, priority)
VALUES('282e1486-e017-442d-bf86-7a41f8c54208', NULL, 'password', '5809b48e-b705-4b3e-be9f-16ce0380cb45', 1674144205658, 'My password', '{"value":"CLjrvS+eZhW7mZLsrsh2J4PFV9tSnuRLbXdk3zOMAz4Gd43uncF82/XUJzwRB81AhEzo5iTbeRJcdTNew68hOw==","salt":"B3GWb1ueKbn6EiSZwS+W9A==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
