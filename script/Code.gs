/*
 * Copyright 2017 Usbong Social Systems, Inc.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 *     
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
function myFunction() {
   var retroCCEmailAddress = "order@retrocc.ph"
   var usbongSpecialtyBookstoreEmailAddress = "order@usbong.ph";
   
   var usbongSpecialtyBookstoreOrderContainer = [];
   var retroCCOrderContainer = [];
  
   var purchaseOrderThread = GmailApp.getInboxThreads(0,50);
   for (var i=0; i<purchaseOrderThread.length; i++) {     
     var subjectHeader = purchaseOrderThread[i].getFirstMessageSubject();
     if (subjectHeader.indexOf("Purchase Order") != -1) {
       var message = purchaseOrderThread[i].getMessages()[0];
       
       var productItemsArrayList = [];
       var startIndex = message.getBody().indexOf("-Purchase Order Summary-");
       
       var rawProductItems = message.getBody().substring(startIndex).split("Customer")[0];
       var extractedProductItems = [];
       extractedProductItems = rawProductItems.replace("--<br>","-<br>").split("-<br>");
       
       //start with 1, not 0, which is "-Purchase Order Summary-", 
       //until the second to the last item in extractedProductItems
       for (var k=1; k<extractedProductItems.length-1; k++) {
         var s = extractedProductItems[k].replace(/<br>/g,"");
         if (s.indexOf("? RetroCC") != -1) {
           retroCCOrderContainer.push(s);
         }
         else if (s.indexOf("? Usbong Specialty Bookstore") != -1) {
           usbongSpecialtyBookstoreOrderContainer.push(s);
         }
       }

       var customerInfo = "Customer" + message.getBody().substring(startIndex).split("Customer")[1];
       customerInfo = customerInfo.substring(0,customerInfo.indexOf("</p>")).replace(/<br>/g,"");

       //RETROCC ORDER SUMMARY------------------------------------------------
       var retroCCOrderSummary = "-Purchase Order Summary-";
       for (var j=0; j<retroCCOrderContainer.length; j++) {
         retroCCOrderSummary += (retroCCOrderContainer[j]+"-\n");
       }
       retroCCOrderSummary += customerInfo;

       //USBONG SPECIALTY BOOKSTORE ORDER SUMMARY------------------------------------------------
       var usbongSpecialtyBookstoreOrderSummary = "-Purchase Order Summary-";
       for (var j=0; j<usbongSpecialtyBookstoreOrderContainer.length; j++) {
         usbongSpecialtyBookstoreOrderSummary += (usbongSpecialtyBookstoreOrderContainer[j]+"-\n");
       }
       usbongSpecialtyBookstoreOrderSummary += customerInfo;
/*       
       Logger.log(retroCCOrderSummary);       
       Logger.log(usbongSpecialtyBookstoreOrderSummary);
*/

       //SEND PURCHASE ORDER EMAIL TO EACH RELEVANT MERCHANT       
       var now = new Date().getTime(); //produces a number based on the date-time stamp
//       Logger.log(new Date(1496968250761)); //to convert the number into a data-time stamp
       
//       GmailApp.sendEmail(retroCCEmailAddress, "Purchase Order: "+now.toString(), retroCCOrderSummary);
       GmailApp.sendEmail(usbongSpecialtyBookstoreEmailAddress, "Purchase Order: "+now.toString(), usbongSpecialtyBookstoreOrderSummary);
     }     
   }
}