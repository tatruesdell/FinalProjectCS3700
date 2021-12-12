**Data Dictionary**

_Attribute: Description_

TrainID: Unique identification number for the train
<br />TrainModel:	Model number of the train
<br />TrainColor:	Color to identify the train
<br />TrainNoOfSeats:	Number of seats in the train to keep track of booking
		
StationID:	Unique identification number for the train station
<br />StationName:	Name of the train station
<br />StationCity:City the train station is located in
<br />StationState:	State the train station is located in
<br />StationStreet: Street the train station is located on
<br />StationPhoneNumber:	Contact information for the train station
	
	
PassengerID: Unique identification number for the passenger
<br />PassengerFirstName: First name of the passenger
<br />PassengerLastName: Last name of the passenger
<br />PassengerEmail: email address of the passenger
<br />PassengerPhoneNumber: phone number of the passenger
<br />SubscriptionID: The unique id of the subscription type they are subscribed to
<br />SubscriptionPoints: Current number of points accumulated
	
	
ScheduleID: Unique identification for the schedule
<br />OperatorID: the operator that drives for this schedule
<br />TrainID: the train that will be driven for this schedule
<br />RouteID: the route for this schedule
<br />StartDate: The start date for the schedule
<br />TicketPrice: The price of a ticket for the schedule
	
	
OperatorID: Unique identification number of the operator
<br />OperatorFirstName: first name of the operator
<br />OperatorLastName:	last name of the operator
<br />OperatorDOB: Operator date of birth
<br />OperatorPhoneNumber: phone number for the operator
<br />OperatorEmail: email address of the operator
	
	
BookingNumber: Unique number for a booking
<br />PassengerID: the identification of passenger the booking is made for
<br />ScheduleID: the identification of the schedule the booking is made for
<br />PointsUsed: T or F character value to keep track of whether the ticket was bought using points or not 
	
	
RouteID: Unique identification of the route 
<br />DepartureStationID: the departure station for the route
<br />ArrivalStationID: the arrival station for the route
	
	
SubscriptionID: Unique identification number for the subscription
<br />SubscriptionMembershipRank: Rank of the subscription type (base, bronze, silver, gold, platinum)
<br />SubscriptionDescription: The description of the subscription
<br />SubscriptionFees: Fees associated with the subscription
<br />SubscriptionPointsFree: Points required to redeem for one free booking
	
	
TimingID: Unique identification number for the timing
<br />StartTime: Start time for a schedule
<br />EndTime: End time for a schedule 
