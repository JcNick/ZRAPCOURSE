CLASS zcl_rap_eml_1234 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_1234 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " step 1 - READ
    READ ENTITIES OF ZI_RAP_Travel_1234
      ENTITY travel
        FROM VALUE #( ( TravelUUID = '119E2373C04FDAEFA217000802F0E827EA' ) )
      RESULT DATA(travels)
             FAILED DATA(failed)
       REPORTED DATA(reported).

    out->write( travels ).
    LOOP AT failed-travel INTO data(tmpfailed).
        out->write( tmpfailed-%fail-cause ).
         " complex structures not supported by the console output

    ENDLOOP..
    out->write( failed ).    " complex structures not supported by the console output
    out->write( reported ).  " complex structures not supported by the console output

    out->write( travels ).

    " step 2 - READ with Fields
    READ ENTITIES OF ZI_RAP_Travel_1234
      ENTITY travel
        FIELDS ( AgencyID CustomerID )
      WITH VALUE #( ( TravelUUID = '9E2373C04FDAEFA217000802F0E827EA' ) )
      RESULT DATA(travels2).
    out->write( travels2 ).

    " step 2 - READ with Fields
    READ ENTITIES OF ZI_RAP_Travel_1234
      ENTITY travel
      ALL FIELDS WITH
             VALUE #( ( TravelUUID = '9E2373C04FDAEFA217000802F0E827EA' ) )
      RESULT DATA(travels3).
    out->write( travels3 ).

    " step 4 - READ By Association
    READ ENTITIES OF ZI_RAP_Travel_1234
      ENTITY travel BY \_Booking
        ALL FIELDS WITH VALUE #( ( TravelUUID = '9E2373C04FDAEFA217000802F0E827EA' ) )
      RESULT DATA(bookings).

    out->write( bookings ).

    " step 6 - MODIFY Update
    MODIFY ENTITIES OF ZI_RAP_Travel_1234
           ENTITY travel
        UPDATE
          SET FIELDS WITH VALUE
            #( ( TravelUUID  = '9B2373C04FDAEFA217000802F0E827EA'
                 Description = 'I like RAP@openSAP' ) )

     FAILED DATA(failed6)
     REPORTED DATA(reported6).
    " step 6b - Commit Entities
    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_1234
      FAILED     DATA(failed_commit6)
      REPORTED   DATA(reported_commit6).

    out->write( 'Update done' ).

    " step 7 - MODIFY Create
    MODIFY ENTITIES OF ZI_RAP_Travel_1234
      ENTITY travel
        CREATE
          SET FIELDS WITH VALUE
            #( ( %cid        = 'hejx'
                 AgencyID    = '70012'
                 CustomerID  = '14'
                 BeginDate   = cl_abap_context_info=>get_system_date( )
                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
                 Description = 'I like RAP@openSAP' ) )

     MAPPED DATA(mapped7)
     FAILED DATA(failed7)
     REPORTED DATA(reported7).

    out->write( mapped7-travel ).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_1234
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Create done' ).


    " step 8 - MODIFY Delete
    LOOP AT mapped7-travel INTO data(tmp_trasvel).
      MODIFY ENTITIES OF ZI_RAP_Travel_1234
        ENTITY travel
          DELETE FROM
            VALUE
              #( ( TravelUUID  = tmp_trasvel-TravelUUID ) )

       FAILED DATA(failed8)
       REPORTED DATA(reported8).

      COMMIT ENTITIES
        RESPONSE OF ZI_RAP_Travel_1234
        FAILED     DATA(failed_commit8)
        REPORTED   DATA(reported_commit8).

      out->write( 'Delete done' && tmp_trasvel-TravelUUID   ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
