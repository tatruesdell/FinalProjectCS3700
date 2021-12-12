This file contains the relational schema for the database in order of table levels, constraints, and any sequences used for primary keys.

**Relational Schema**
<br />train(**trainID**, trainName, trainModel, trainNoOfSeats)
<br />station(**stationID**, stationName, stationCity, stationState, stationStreet, stationPhoneNumber)
<br />operator(**operatorID**, operatorFirstName, operatorLastName, operatorDOB, operatorEmail, operatorPhoneNumber)
<br />subscription(**subscriptionID**, subscriptionDescription, subscriptionMembershipRank, subscriptionFees, subscriptionPointsFree)
<br />timing(**timingID**, startTime, endTime)

passenger(**passengerID**, passengerFirstName, passengerLastName, passengerPhoneNumber, passengerEmail, subscriptionPoints, _subscriptionID_)
<br />route(**routeID**, _arrivalStationID, departureStationID_)

schedule(**scheduleID**, scheduleStartDate, _timingID, operatorID, trainID, routeID_, ticketPrice)

booking(**bookingNumber**, _passengerID, scheduleID_, pointsUsed)

**Constraints**
>	NOT NULL
>>	train_name_nn,  train_model_nn,  train_seats_nn <br />
>>	station_name_nn,  station_city_nn,  station_state_nn,  station_street_nn,  station_phone_nn <br />
>>	operator_first_name_nn  operator_last_name_nn  operator_DOB_nn  operator_email_nn  operator_phone_number_nn <br />
>>  subscription_description_nn  subscription_rank _nn,  subscription_fees_nn,  subscription_points_free_nn <br />
>>	start_time_nn,  end_time_nn <br />
>>	passenger_first_name_nn,  passenger_last_name_nn,  passenger_email_nn <br />
>>	arrival_station_id_nn,  departure_station_id_nn <br />
>>	schedule_start_date_nn,  schedule_timing_id_nn,  schedule_route_id_nn,  schedule_train_id_nn,  schedule_operator_id_nn, schedule_ticket_price_nn <br />
>>	booking_passenger_id,  booking_schedule_id

>	UNIQUE
>>	route_arrival_departure_uk UNIQUE(arrivalStationID, departureStationID) <br />
>>	operator_timing_date_uk UNIQUE(operatorID, timingID, scheduleStartDate), train_timing_date_uk UNIQUE(trainID, timingID, scheduleStartDate)

>	CHECK
>>	route_arrival_departure_cc CHECK(arrivalStationID <> departureStationID) <br />
>>	points_used_cc  CHECK (pointsused IN ('T', 'F'))

**Sequences**
> train_uid_seq <br />
> station_uid_seq <br />
> operator_uid_seq <br />
> subscription_uid_seq <br />
> timing_uid_seq <br />
> passenger_uid_seq <br />
> route_uid_seq <br />
> schedule_uid_seq <br />
> booking_uid_seq


