using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Group_C_Autoshop
{
    //creating a class to store parts data
    class Parts
    {
        private string partName;
        private int quantity;
        private double cost;

        public Parts()
        {
             partName = "";
             quantity = 0;
             cost = 0.00;
        }

        public Parts(string name, int quan, double costs)
        {
            partName = name;
            quantity = quan;
            cost = costs;
        }

        public string MyName {
            get { return partName; }
            set { partName = value; }
        }

        public int MyQuantity {
            get { return quantity; }
            set { quantity = value; }
        }
        public double MyCost {
            get { return cost; }
            set { cost = value; }
        } 
    }
}