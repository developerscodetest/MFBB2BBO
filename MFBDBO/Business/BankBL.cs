using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MFBDBO.Data;
using MySql.Data.MySqlClient;

namespace MFBDBO.Business
{
    public class BankBL
    {


        BankDA objBankDA = new BankDA();
        List<Bankstbl> ba = new List<Bankstbl>();
        public IEnumerable<Bankstbl> GetAllBanks(Bankstbl ba)
        {
            return objBankDA.BanksAll(1, ba);
        }

        public IEnumerable<Bankstbl> GetBankbyId(Bankstbl ba)
        {
            return objBankDA.BanksAll(2, ba);
        }

        public IEnumerable<Bankstbl> InsertBank(Bankstbl ba)
        {
            return objBankDA.BanksAll(3, ba);
        }
        public IEnumerable<Bankstbl> UpdateBank(Bankstbl ba)
        {
            return objBankDA.BanksAll(4, ba);
        }
        public IEnumerable<Bankstbl> DeleteBank(Bankstbl ba)
        {
            return objBankDA.BanksAll(5, ba);
        }
        public IEnumerable<Bankstbl> UpdateBankIsActive(Bankstbl ba)
        {
            return objBankDA.BanksAll(6, ba);
        }

        public IEnumerable<Bankstbl> GetBankIsActive(Bankstbl ba)
        {
            return objBankDA.BanksAll(7, ba);
        }




    }
}