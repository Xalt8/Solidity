pragma solidity ^0.5.3;

    contract Order {

        enum Status{
            Pending,
            Shipped,
            Accepted,
            Rejected,
            Canceled
        }

        Status public status;

        function ship() view public {
            require(status == Status.Pending);
            status == Status.Shipped;
        }

        function acceptDelivery() view public {
            require(status == Status.Shipped);
            status == Status.Accepted;    
        }

        function rejectDelivery() view public {
            require(status == Status.Shipped);
            status == Status.Rejected;
        }

        function cancelled() view public {
            require(status == Status.Pending);
            status == Status.Canceled;
        }
    }