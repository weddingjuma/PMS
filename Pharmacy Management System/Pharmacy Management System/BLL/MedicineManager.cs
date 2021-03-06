﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pharmacy_Management_System.DAL;
using Pharmacy_Management_System.MODEL;

namespace Pharmacy_Management_System.BLL
{
    class MedicineManager
    {
        MedicineGateWay myMedicineGateWay = new MedicineGateWay();

        public List<Medicine> ShowAll()
        {
            return myMedicineGateWay.ShowAll();
        }
        public void Save(Medicine medicine)
        {
            myMedicineGateWay.Save(medicine);
        }
    }
}
