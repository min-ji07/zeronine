 var sell_price1;
   var sell_price2;
   var sell_price3;
   var amount1 = 0;
   var amount2 = 0;
   var amount3 = 0;
   var totalSum = 0;
   var total1 = parseInt(document.getElementById('sell_price1').value);
   var total2 = parseInt(document.getElementById('sell_price2').value);
   var total3 = parseInt(document.getElementById('sell_price3').value);
   function init() {
   document.getElementById('sum1').innerHTML = sell_price1;
   document.getElementById('sum2').innerHTML = sell_price2;
   document.getElementById('sum3').innerHTML = sell_price3;
   }

   function add() {
      amount1++;
      onchange(total1);

   }

   function add2() {
      amount2++;
      onchange(total2);

   }

   function add3() {
      amount3++;
      onchange(total3);
   }

   function del() {
      if (amount1 > 1) {
         amount1--;
         onchange2(total1);
      }
   }

   function del2() {
      if (amount2 > 1) {

         amount2--;
         onchange2(total2);
      }
   }

   function del3() {
      if (amount3 > 1) {

         amount3--;
         onchange2(total3);
      }
   }

   function onchange(total) {
      totalSum += parseInt(total);
      document.getElementById('totalSum').innerHTML = totalSum;
      document.getElementById('amount1').value = amount1;
      document.getElementById('amount2').value = amount2;
      document.getElementById('amount3').value = amount3;

   }
   function onchange2(total) {
      totalSum -= parseInt(total);
      document.getElementById('totalSum').innerHTML = totalSum;
      document.getElementById('amount1').value = amount1;
      document.getElementById('amount2').value = amount2;
      document.getElementById('amount3').value = amount3;


   }

   function delete1() {
      $('#dt1').hide();
      amount1 = parseInt(document.getElementById('amount1').value); 
      sell_price1 = parseInt(document.getElementById('sell_price1').value);
      totalSum -= (amount1 * sell_price1);
      document.getElementById('totalSum').innerHTML = totalSum;
      document.getElementById('amount1').value = 0;
      amount1 = 0;
   }
   function delete2() {
      $('#dt2').hide();
      amount2 = parseInt(document.getElementById('amount2').value);
      document.getElementById('amount2').value = amount2;
      sell_price2 = parseInt(document.getElementById('sell_price2').value);
      totalSum -= (amount2 * sell_price2);
      document.getElementById('totalSum').innerHTML = totalSum;
      document.getElementById('amount2').value = 0;
      amount2= 0;
   }
   function delete3() {
      $('#dt3').hide();
      amount3 = parseInt(document.getElementById('amount3').value);
      
      document.getElementById('amount3').value = amount3;
      
      sell_price3 = parseInt(document.getElementById('sell_price3').value);
      totalSum -= (amount3 * sell_price3);
      document.getElementById('totalSum').innerHTML = totalSum;
      document.getElementById('amount3').value = 0;
      amount3  =0;
   }

   function selectEvent(selectObj) {

      if (selectObj.value == '1') {
         $('#dt1').show();
         amount1++;

         onchange(total1);
      } else if (selectObj.value == '2') {
         $('#dt2').show();
         amount2++;

         onchange(total2);
      } else if (selectObj.value == '3') {
         $('#dt3').show();
         amount3++;
         onchange(total3);
      }




   }