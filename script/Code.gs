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
   var unreadCount = GmailApp.getInboxUnreadCount();
//   Logger.log("Unread count: "+unreadCount);

   var usbongSpecialtyBookstoreEmailAddress = "order@usbong.ph";
   var retroCCEmailAddress = "order@retrocc.ph"
   
   var usbongSpecialtyBookstoreOrderContainer = [];
   var retroCCOrderContainer = [];
  
   var purchaseOrderThread = GmailApp.getInboxThreads(0,50);
   for (var i=0; i<purchaseOrderThread.length; i++) {     
     var subjectHeader = purchaseOrderThread[i].getFirstMessageSubject();
     if (subjectHeader.indexOf("Purchase Order") != -1) {
       var message = purchaseOrderThread[i].getMessages()[0];
//       Logger.log("Purchase Order: "+message.getBody());
       
       var productItemsArrayList = [];
       //Logger.log(message.getBody().indexOf("-Purchase Order Summary-"));
       var startIndex = message.getBody().indexOf("-Purchase Order Summary-");
//       Logger.log(message.getBody().substring(startIndex));
       
       var rawProductItems = message.getBody().substring(startIndex).split("Customer")[0];
//       Logger.log(rawProductItems);
       var extractedProductItems = [];
       extractedProductItems = rawProductItems.replace("--<br>","-<br>").split("-<br>");
//       Logger.log(extractedProductItems[1].replace(/<br>/g,""));
       
       Logger.log(extractedProductItems.length);
//       for (var i in extractedProductItems) {
       for (var k=1; k<extractedProductItems.length-1; k++) { //start with 1, not 0, which is "-Purchase Order Summary-"
         var s = extractedProductItems[k].replace(/<br>/g,"");
         if (s.indexOf("? RetroCC") != -1) {
           retroCCOrderContainer.push(s);
         }
         else if (s.indexOf("? Usbong Specialty Bookstore") != -1) {
           usbongSpecialtyBookstoreOrderContainer.push(s);
         }
       }

       //RETROCC ORDER SUMMARY------------------------------------------------
       var retroCCOrderSummary = "";
       for (var j=0; j<retroCCOrderContainer.length; j++) {
         //Logger.log(retroCCOrderContainer[j]);
         retroCCOrderSummary += retroCCOrderContainer[j];
       }

       //USBONG SPECIALTY BOOKSTORE ORDER SUMMARY------------------------------------------------
       var usbongSpecialtyBookstoreOrderSummary = "";
       for (var j=0; j<usbongSpecialtyBookstoreOrderContainer.length; j++) {
         usbongSpecialtyBookstoreOrderSummary += usbongSpecialtyBookstoreOrderContainer[j];
       }

       Logger.log(retroCCOrderSummary);       
       Logger.log(usbongSpecialtyBookstoreOrderSummary);
       
       var customerInfo = "Customer" + message.getBody().substring(startIndex).split("Customer")[1];
//       Logger.log(customerInfo);       
/*     
         message.forward("merchant@address.ph");         
*/       
     }     
   }
}
