**Data Dictionary**

_Attribute: Description_

TrainID: Unique identification number for the train
TrainModel:	Model number of the train
TrainColor:	Color to identify the train
TrainNoOfSeats:	Number of seats in the train to keep track of booking
	
StationID:	Unique identification number for the train station
StationName:	Name of the train station
StationCity:City the train station is located in
StationState:	State the train station is located in
StationStreet: Street the train station is located on
StationPhoneNumber:	Contact information for the train station
	
PassengerID: Unique identification number for the passenger
PassengerFirstName: First name of the passenger
PassengerLastName: Last name of the passenger
PassengerEmail: email address of the passenger
PassengerPhoneNumber: phone number of the passenger
SubscriptionID: The unique id of the subscription type they are subscribed to
SubscriptionPoints: Current number of points accumulated
	
ScheduleID: Unique identification for the schedule
OperatorID: the operator that drives for this schedule
TrainID: the train that will be driven for this schedule
RouteID: the route for this schedule
StartDate: The start date for the schedule
TicketPrice: The price of a ticket for the schedule
	
OperatorID: Unique identification number of the operator
OperatorFirstName: first name of the operator
OperatorLastName:	last name of the operator
OperatorDOB: Operator date of birth
OperatorPhoneNumber: phone number for the operator
OperatorEmail: email address of the operator
	
BookingNumber: Unique number for a booking
PassengerID: the identification of passenger the booking is made for
ScheduleID: the identification of the schedule the booking is made for
PointsUsed: T or F character value to keep track of whether the ticket was bought using points or not 
	
RouteID: Unique identification of the route 
DepartureStationID: the departure station for the route
ArrivalStationID: the arrival station for the route
	
SubscriptionID: Unique identification number for the subscription
SubscriptionMembershipRank: Rank of the subscription type (base, bronze, silver, gold, platinum)
SubscriptionDescription: The description of the subscription
SubscriptionFees: Fees associated with the subscription
SubscriptionPointsFree: Points required to redeem for one free booking
	
TimingID: Unique identification number for the timing
StartTime: Start time for a schedule
EndTime: End time for a schedule 
