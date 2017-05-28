/*
 * Copyright 2016 Michael Syson
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
package usbong.android.store_app;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import usbong.android.db.UsbongDbHelper;
import usbong.android.utils.AppRater;
import usbong.android.utils.UsbongConstants;
import usbong.android.utils.UsbongUtils;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.AppCompatRadioButton;
import android.text.Html;
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

/*
 * This is Usbong's Main Menu activity. 
 */
public class UsbongMainActivity extends AppCompatActivity/*Activity*/ 
{	
	//added by Mike, 20170525
	private String currCategory = UsbongConstants.ITEMS_LIST_DEFAULT;

	private static UsbongMainActivity instance;
				
	public static String timeStamp;
	
//	private static Date startTime;	
	
	protected UsbongDecisionTreeEngineActivity myUsbongDecisionTreeEngineActivity;
	protected SettingsActivity mySettingsActivity;
	
	private ProgressDialog myProgressDialog;

	//edited by Mike, 20170525
	private static int currModeOfPayment=UsbongConstants.defaultModeOfPayment; 
    
	public ListView treesListView;
	
	private CustomDataAdapter mCustomAdapter;
	private ArrayList<String> listOfTreesArrayList;
	
	private boolean isInTreeLoader;
	
	//added by Mike, 20170523
	private UsbongDbHelper myDbHelper;
	private SQLiteDatabase mySQLiteDatabase;
	
	private int currProductTypeId = 1; //default
    
    @Override
    public void onCreate(Bundle savedInstanceState) 
    {
		getWindow().requestFeature(Window.FEATURE_ACTION_BAR);

        super.onCreate(savedInstanceState);

        //added by Mike, 27 Sept. 2015
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        
        instance=this;
        
        //added by Mike, 25 Sept. 2015
//        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle(getResources().getString(R.string.usbong));//getResources().getString(R.string.app_name)); //edited by Mike, 20170214
//        getSupportActionBar().setDisplayUseLogoEnabled(true);        

//    	if (instance==null) { //comment this out, since the app seems to retain the instance even after we do a finish to GameActivity to close the app...
	        setContentView(R.layout.main);	        
//	    	startTime = new Date();	        

            //added by Mike, 20161117
        	Bundle extras = getIntent().getExtras();
        	if (extras!=null) {
	        	String message = extras.getString("completed_tree");

	        	if (message.equals("true")) {
			        AppRater.showRateDialog(this); 
	        	}	        		
        	}

	        reset();

        	//added by Mike, 20170525
    		myProgressDialog = ProgressDialog.show(instance, "Loading...",
    				  "This takes only a short while.", true, false);				  
    		new MyBackgroundTask().execute();    
        	
//	        initMainMenuScreen();
//	        init();
    }
    
    public static UsbongMainActivity getInstance() {
    	return instance;
    }
    
    /*
     * Initialize this activity
     */
    public void init()
    {    	    	
		//added by Mike, 20170310
    	UsbongUtils.deleteRecursive(new File(UsbongUtils.BASE_FILE_PATH_TEMP));

    	
    	try{    		
    		//commented out by Mike, 4 Oct. 2015
  			UsbongUtils.createUsbongFileStructure();
  			
  			//added by Mike, 20160417
  			UsbongUtils.initUsbongConfigFile();
    	}
    	catch(IOException ioe) {
    		ioe.printStackTrace();
    	}
		
		//added by Mike, 30 April 2015
		isInTreeLoader=false;		

		UsbongUtils.clearTempFolder();
		
/*    	
    	//added by Mike, 20170523
		final Spinner categorySpinner = (Spinner) findViewById(R.id.category);
		
		//TODO: retrive items from DB
		final ArrayList<String> categoryItems = new ArrayList<String>();
		categoryItems.add("All");// ▽");
		categoryItems.add("Books");
		categoryItems.add("Combos");
		categoryItems.add("Beverages");
		 
//		final int categoryItemsLength = categoryItems.size();
		
		final ArrayAdapter<String> adapter = new ArrayAdapter<String>(instance, android.R.layout.simple_dropdown_item_1line, categoryItems);
		categorySpinner.setAdapter(adapter);	            	
*/		
/*
		DisplayMetrics metrics = getResources().getDisplayMetrics();
		float dp = 20f;
		float fpixels = metrics.density * dp;
		final int pixels = (int) (fpixels + 0.5f);
*/	
/*    	
		//added by Mike, 20170509	            		
		categorySpinner.setOnItemSelectedListener(new OnItemSelectedListener() {
//			private int prevQuantityIndex;
			@Override
			public void onItemSelected(AdapterView<?> arg0,
					View arg1, final int arg2, long arg3) {
*/					
/*				
				categoryItems.clear();
				categoryItems.add("All");
				categoryItems.add("Books");
				categoryItems.add("Combos");
				categoryItems.add("Beverages");
				
				if (categoryItems.get(arg2).equals(
						categorySpinner.getItemAtPosition(arg2).toString())) {
					categoryItems.remove(arg2);
					String q = categorySpinner.getItemAtPosition(arg2).toString().trim() + " ▽";
					categoryItems.add(arg2, q);	
				}
*/				
/*				
				categorySpinner.getLayoutParams().width = categorySpinner.getItemAtPosition(arg2).toString().length()*pixels;
				categorySpinner.invalidate();
*/
/*
				if (quantitySpinner.getItemAtPosition(arg2).toString().equals("Remove")){
		        	new AlertDialog.Builder(CartActivity.this).setTitle("Hey!")
					.setMessage("Are you sure you want to remove this item from your cart?")
					.setPositiveButton("Yes", new DialogInterface.OnClickListener() {					
						@Override
						public void onClick(DialogInterface dialog, int which) {
							items.remove(position);
							quantityList.remove(position);																								

							updateItemsInCart(items);
							
							//added by Mike, 20170509
							if (UsbongUtils.itemsInCart.isEmpty()) {
								UsbongUtils.cartIconDrawableResourceId = R.drawable.cart_icon;
								myActivityInstance.invalidateOptionsMenu();
							}
							
							prevQuantityIndex=0;
							instance.initCart();
						}
					})
					.setNegativeButton("No", new DialogInterface.OnClickListener() {					
						@Override
						public void onClick(DialogInterface dialog, int which) {
							quantitySpinner.setSelection(prevQuantityIndex);
						}
					}).show();	 
				}								
				else {
//					if (prevQuantityIndex!=arg2) {
						prevQuantityIndex=arg2;
						quantityList.remove(position);
						String q = quantitySpinner.getSelectedItem().toString().trim();
						quantityList.add(position, q);

						//added by Mike, 20170511
						updateItemsInCart(items);
						
	            		processSubtotal(v, Integer.parseInt(q), s);
						processOrderTotal();
//					}
				}
*/				
/*    	
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				// TODO Auto-generated method stub				
			}	            			
		});
*/    	
        final EditText searchEditText = (EditText)findViewById(R.id.search_edittext);
        //Reference: https://stackoverflow.com/questions/3205339/android-how-to-make-keyboard-enter-button-say-search-and-handle-its-click;
    	//last accessed: 20170523
    	//answer by: Robby Pond; edited by: sergej shafarenka
    	searchEditText.setOnEditorActionListener(new TextView.OnEditorActionListener() {
    	    @Override
    	    public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
    	        if (actionId == EditorInfo.IME_ACTION_SEARCH) {
    	            performSearch(searchEditText.getText().toString());
    	            showSearchResults();
    	            return true;
    	        }
    	        return false;
    	    }
    	});
    	
    	//Reference: https://stackoverflow.com/questions/13135447/setting-onclicklistner-for-the-drawable-right-of-an-edittext;
    	//last accessed: 20170525
    	//answer by: AZ_
    	searchEditText.setOnTouchListener(new OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
//                final int DRAWABLE_LEFT = 0;
//                final int DRAWABLE_TOP = 1;
                final int DRAWABLE_RIGHT = 2;
//                final int DRAWABLE_BOTTOM = 3;

                if(event.getAction() == MotionEvent.ACTION_UP) {
                    if(event.getRawX() >= (searchEditText.getRight() - searchEditText.getCompoundDrawables()[DRAWABLE_RIGHT].getBounds().width())) {
                        // your action here
        	            performSearch(searchEditText.getText().toString());
        	            showSearchResults();
        	            searchEditText.clearFocus();
                        return true;
                    }
                }
                return false;
            }
        });
    }
    
    public void loadMerchantStore(String merchantName) {
    	merchantName = "RetroCC";
    	
    	myDbHelper = new UsbongDbHelper(this);
        myDbHelper.initializeDataBase();

        listOfTreesArrayList.clear(); //added by Mike, 20170525
        
        try {
	         mySQLiteDatabase = myDbHelper.getReadableDatabase();

		     String getMerchantId = "select * from '" + "merchant" + "'" + " where merchant_name +LIKE '%"+merchantName+"%'";
		     Cursor cMerchantId = mySQLiteDatabase.rawQuery(getMerchantId, null);
     		 int merchantId = Integer.parseInt(cMerchantId.getString(cMerchantId.getColumnIndex("merchant_id")));
		        		     		     
		     String getMerchantProducts = "select * from '" + "product" + "'" + " where merchant_id="+merchantId;
		     Cursor c = mySQLiteDatabase.rawQuery(getMerchantProducts, null);
		     
		     if (c != null) {
			        if (c.moveToFirst()) { // if Cursor is not empty
			        	while (!c.isAfterLast()) {
			        		String price = c.getString(c.getColumnIndex("price"));
			        		if (price==null) {
			        			price = "out of stock";
			        		}
			        		else {
			        			price = "₱" + price;
			        		}
			        		
			        		String productDetails="";
			        		switch(currCategory) {
				    			case UsbongConstants.ITEMS_LIST_BEVERAGES:
/*					    				
						        		productDetails =  "Name: "+c.getString(c.getColumnIndex("name"))+"\n"+
					   							 "Price: "+price+"\n"+
					   							 "Language: "+c.getString(c.getColumnIndex("language"));
*/
					        		productDetails =  "<b>"+c.getString(c.getColumnIndex("name"))+"</b>\n"+
				   							 "<font color='#644d17'><b>"+price+"</b>\n[Free Delivery]</font>";
					        		break;
				    			default:
/*					    				
						        		productDetails =  "Title: "+c.getString(c.getColumnIndex("name"))+"\n"+
					   							 "Author: "+c.getString(c.getColumnIndex("author"))+"\n"+
					   							 "Price: "+price+"\n"+
					   							 "<b>Format:</b> "+c.getString(c.getColumnIndex("format"))+"\n"+	
					   							 "Language: "+c.getString(c.getColumnIndex("language"));
*/
					        		productDetails =  "<b>"+c.getString(c.getColumnIndex("name"))+"</b>\n"+
				   							 ""+c.getString(c.getColumnIndex("author"))+"\n"+
				   							 "<font color='#644d17'><b>"+price+"</b>\n[Free Delivery]</font>";
				    				break;
			        		}
			        	}
			        }
			        else {
			           // Cursor is empty
			        	Log.d(">>>>>", "cursor is empty");
			        }
			     }
			     else {
			        // Cursor is null
			        	Log.d(">>>>>", "cursor is null");
			     }
        } catch (Exception ex) {
           ex.printStackTrace();
        } finally {
            try {
                myDbHelper.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                myDbHelper.close();
            }        	 
        }
    }
    
    public void performSearch(String s) {
    	myDbHelper = new UsbongDbHelper(this);
        myDbHelper.initializeDataBase();

        listOfTreesArrayList.clear(); //added by Mike, 20170525
        
        try {
	         mySQLiteDatabase = myDbHelper.getReadableDatabase();
	         
		     String table = "product";
		     String query = "";
		     
		     if (s==null) {
			     query = "select * from '" + table + "'" + " where product_type_id="+currProductTypeId;
		     }
		     else {
			     query = "select * from '"+table+"' where NAME like '%"+s+"%' OR author LIKE '%"+s+"%'";		     		    	 
			     currCategory = UsbongConstants.ITEMS_LIST_DEFAULT;
		     }		     
		     
//		     String query = "select * from '" + table + "'" + " where product_type_id="+currProductTypeId;
		     Cursor c = mySQLiteDatabase.rawQuery(query, null);
		     if (c != null) {
			        if (c.moveToFirst()) { // if Cursor is not empty
			        	while (!c.isAfterLast()) {
			        		String price = c.getString(c.getColumnIndex("price"));
			        		if (price==null) {
			        			price = "out of stock";
			        		}
			        		else {
			        			price = "₱" + price;
			        		}
			        		
			        		String productDetails="";
/*			        		if (s==null) {
  */
		    			     String queryMerchantName = "select merchant_name from '" + "merchant" + "'" + " where merchant_id="+c.getString(c.getColumnIndex("merchant_id"));
		    			     Cursor cMerchantName = mySQLiteDatabase.rawQuery(queryMerchantName, null);
		    			     String merchantName="N/A";
		    			     if (cMerchantName.moveToFirst()) {
		    			    	 merchantName = cMerchantName.getString(cMerchantName.getColumnIndex("merchant_name"));
		    			     }
/*		    			     
				        		switch(currCategory) {
					    			case UsbongConstants.ITEMS_LIST_BEVERAGES:
						        		productDetails =  "<b>"+c.getString(c.getColumnIndex("name"))+"</b>\n"+
					   							 "<font color='#644d17'><b>"+price+"</b>\n[Free Delivery]</font>"+
					   							 "MerchantName: "+merchantName;
						        		break;
					    			default:
*/					    			
					    				String authorString = c.getString(c.getColumnIndex("author"));
					    				if (authorString==null) {
					    					authorString="";
					    				}
					    				else {
					    					authorString = authorString +"\n";
					    				}
					    				
						        		productDetails =  "<b>"+c.getString(c.getColumnIndex("name"))+"</b>\n"+
					   							 authorString+
					   							 "<font color='#644d17'><b>"+price+"</b>\n[Free Delivery]</font>"+
					   							 "MerchantName: "+merchantName;
/*					    				break;
				        		}
*/				        		
/*				        
			        		}
			        		else {
*/			        		
				        		/*if (Integer.parseInt(c.getString(c.getColumnIndex("product_type_id")))
				        				==UsbongConstants.PRODUCT_TYPE_BEVERAGES) {
				        			//TODO: remove field labels
				        			productDetails =  "Name: "+c.getString(c.getColumnIndex("name"))+"\n"+
				   							 "Price: "+price+"\n"+
				   							 "Language: "+c.getString(c.getColumnIndex("language"));			        			
				        		}
				        		else {*/
/*			        			
					        		productDetails =  "Title: "+c.getString(c.getColumnIndex("name"))+"\n"+
				   							 "Author: "+c.getString(c.getColumnIndex("author"))+"\n"+
				   							 "Price: "+price+"\n"+
				   							 "<b>Format:</b> "+c.getString(c.getColumnIndex("format"))+"\n"+	
				   							 "Language: "+c.getString(c.getColumnIndex("language"));			        			
*/
/*			        			
				        		productDetails =  "<b>"+c.getString(c.getColumnIndex("name"))+"</b>\n\n"+
			   							 ""+c.getString(c.getColumnIndex("author"))+"\n\n"+
			   							 "<b><font color='#7c693d'>"+price+"</font></b>";	
*/				        		
/*				        		}			        		
*/	
/*				        		
			        		}
*/
				        	listOfTreesArrayList.add(productDetails);
			        	    c.moveToNext();
			        	  }
			        }
			        else {
			           // Cursor is empty
			        	Log.d(">>>>>", "cursor is empty");
			        }
			     }
			     else {
			        // Cursor is null
			        	Log.d(">>>>>", "cursor is null");
			     }
        } catch (Exception ex) {
           ex.printStackTrace();
        } finally {
            try {
                myDbHelper.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                myDbHelper.close();
            }        	 
        }
    }

    public void showSearchResults() {
    	mCustomAdapter = new CustomDataAdapter(this, R.layout.tree_loader, listOfTreesArrayList);
		mCustomAdapter.sort(); //edited by Mike, 20170203
	
		/*
		//Reference: http://stackoverflow.com/questions/8908549/sorting-of-listview-by-name-of-the-product-using-custom-adaptor;
		//last accessed: 2 Jan. 2014; answer by Alex Lockwood
		mCustomAdapter.sort(new Comparator<String>() {
		    public int compare(String arg0, String arg1) {
		        return arg0.compareTo(arg1);
		    }
		});
		*/		
		treesListView = (ListView)findViewById(R.id.tree_list_view);
		treesListView.setLongClickable(true);
		treesListView.setAdapter(mCustomAdapter);
		
//		String pleaseMakeSureThatXMLTreeExistsString = (String) getResources().getText(R.string.pleaseMakeSureThatXMLTreeExistsString);
//		String alertString = (String) getResources().getText(R.string.alertStringValueEnglish);
		
		if (listOfTreesArrayList.isEmpty()){
			String alertTitle;
		    //Reference: http://stackoverflow.com/questions/23024831/android-shared-preferences-example
	        //; last accessed: 20150609
	        //answer by Elenasys
	        //added by Mike, 20150207
			SharedPreferences prefs = getSharedPreferences(UsbongConstants.MY_ACCOUNT_DETAILS, MODE_PRIVATE);
	        if (prefs!=null) {
	        	if (!prefs.getString("firstName", "").trim().equals("")) {
		        	alertTitle = "Hey, "+prefs.getString("firstName", "")+"!";	        		
	        	}
	        	else {
		        	alertTitle = "Hey!";	        		        		
	        	}
	        }
	        else {
	        	alertTitle = "Hey!";	        	
	        }
	        
			new AlertDialog.Builder(UsbongMainActivity.this).setTitle(alertTitle)
			.setMessage("Sorry, we didn't find what you are looking for at our store.")
			.setPositiveButton("OK", new DialogInterface.OnClickListener() {					
				@Override
				public void onClick(DialogInterface dialog, int which) {
					instance.initTreeLoader();
				}
			}).show();	        		        	
		  }	
    }
    
    //added by Mike, 20170525
    //Reference: http://stackoverflow.com/questions/13017122/how-to-show-progressdialog-across-launching-a-new-activity;
    //last accessed: 29 Sept. 2015; answer by: Slartibartfast, 23 Oct. 2012
    class MyBackgroundTask extends AsyncTask<String, Integer, Boolean> {
		@Override
		protected void onPreExecute() {
			Log.d(">>>>","onPreExectue()");
		}
		
		@Override
		protected void onPostExecute(Boolean result) {
			Log.d(">>>>","onPostExecute()");
	    	new Thread(new Runnable() {
			    public void run() {
		            Handler mainHandler = new Handler(getInstance().getBaseContext().getMainLooper());
		            Runnable myRunnable = new Runnable() {
		            	@Override
		            	public void run() {		            		
		    				//added by Mike, 20170525
		    				initTreeLoader();
		    				
						    if (instance.myProgressDialog != null) {
						        instance.myProgressDialog.dismiss();
						    }				            		
		            	}
		            };
		            mainHandler.post(myRunnable);
		    		return; //end this background thread
			    }
			}).start();
		}
		
		@Override
		protected Boolean doInBackground(String... params) {		
			Log.d(">>>>","doInBackground()");
			init();
		    //Do all your slow tasks here but don't set anything on UI
		    //ALL UI activities on the main thread 		
		    return true;
		
		}		
	}
    
  //added by Mike, 20170330
    public void initTreeLoader(String currCategory) {
        this.currCategory = currCategory;
        initTreeLoader();
    }
    
	public void initTreeLoader()
	{
//		setContentView(R.layout.tree_list_interface);				

		isInTreeLoader=true;
		
        Button booksButton = (Button)findViewById(R.id.books_button);
        booksButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                initTreeLoader(UsbongConstants.ITEMS_LIST_BOOKS);
            }
        });    

        Button combosButton = (Button)findViewById(R.id.combos_button);
        combosButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                initTreeLoader(UsbongConstants.ITEMS_LIST_COMBOS);
            }
        });    

        Button beveragesButton = (Button)findViewById(R.id.beverages_button);
        beveragesButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                initTreeLoader(UsbongConstants.ITEMS_LIST_BEVERAGES);
            }
        });    
                    
/*      //edited by Mike, 20170520  
 * 		listOfTreesArrayList = UsbongUtils.getItemArrayList(UsbongUtils.USBONG_TREES_FILE_PATH + currCategory+".txt");
*/
		listOfTreesArrayList = new ArrayList<String>();
		
		currProductTypeId = UsbongConstants.PRODUCT_TYPE_ALL; //default
		switch(currCategory) {
			case UsbongConstants.ITEMS_LIST_BOOKS:
				currProductTypeId = UsbongConstants.PRODUCT_TYPE_BOOKS;
				break;
			case UsbongConstants.ITEMS_LIST_BEVERAGES:
				currProductTypeId = UsbongConstants.PRODUCT_TYPE_BEVERAGES;
				break;
			case UsbongConstants.ITEMS_LIST_COMBOS:
				currProductTypeId = UsbongConstants.PRODUCT_TYPE_COMBOS;
				break;
		}

		performSearch(null);
		
        switch (currCategory) {
        	case UsbongConstants.ITEMS_LIST_BOOKS:
                booksButton.setTypeface(Typeface.DEFAULT_BOLD);
                combosButton.setTypeface(Typeface.DEFAULT);
                beveragesButton.setTypeface(Typeface.DEFAULT);
        		mCustomAdapter = new CustomDataAdapter(this, R.layout.tree_loader, listOfTreesArrayList);
                break;
        	case UsbongConstants.ITEMS_LIST_COMBOS:
                booksButton.setTypeface(Typeface.DEFAULT);
                combosButton.setTypeface(Typeface.DEFAULT_BOLD);            
                beveragesButton.setTypeface(Typeface.DEFAULT);
        		mCustomAdapter = new CustomDataAdapter(this, R.layout.tree_loader_alternative, listOfTreesArrayList);        	
                break;
        	case UsbongConstants.ITEMS_LIST_BEVERAGES:
                booksButton.setTypeface(Typeface.DEFAULT);
                combosButton.setTypeface(Typeface.DEFAULT);            
                beveragesButton.setTypeface(Typeface.DEFAULT_BOLD);
        		mCustomAdapter = new CustomDataAdapter(this, R.layout.tree_loader, listOfTreesArrayList);
                break;
        }
		mCustomAdapter.sort(); //edited by Mike, 20170203
		
/*
		//Reference: http://stackoverflow.com/questions/8908549/sorting-of-listview-by-name-of-the-product-using-custom-adaptor;
		//last accessed: 2 Jan. 2014; answer by Alex Lockwood
		mCustomAdapter.sort(new Comparator<String>() {
		    public int compare(String arg0, String arg1) {
		        return arg0.compareTo(arg1);
		    }
		});
*/		
		treesListView = (ListView)findViewById(R.id.tree_list_view);
		treesListView.setLongClickable(true);
		treesListView.setAdapter(mCustomAdapter);

    	String pleaseMakeSureThatXMLTreeExistsString = (String) getResources().getText(R.string.pleaseMakeSureThatXMLTreeExistsString);
    	String alertString = (String) getResources().getText(R.string.alertStringValueEnglish);

		if (listOfTreesArrayList.isEmpty()){
        	new AlertDialog.Builder(UsbongMainActivity.this).setTitle(alertString)
			.setMessage(pleaseMakeSureThatXMLTreeExistsString)
			.setPositiveButton("OK", new DialogInterface.OnClickListener() {					
				@Override
				public void onClick(DialogInterface dialog, int which) {
					//UsbongDecisionTreeEngineActivity is already the Main Menu
/*
					finish();    
					Intent toUsbongMainActivityIntent = new Intent(UsbongDecisionTreeEngineActivity.this, UsbongMainActivity.class);
					toUsbongMainActivityIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP); 
					startActivity(toUsbongMainActivityIntent);
*/					
				}
			}).show();	        		        	
		  }				  
	}
    
/*    
    public void initMainMenuScreen()
    {    	
    	//added by Mike, 20160126
    	buyButton = (Button)findViewById(R.id.buy_button);
    	buyButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {		
				reset(); //generate new timestamp
				Intent toUsbongDecisionTreeEngineActivityIntent = new Intent().setClass(UsbongMainActivity.getInstance(), UsbongDecisionTreeEngineActivity.class);
				toUsbongDecisionTreeEngineActivityIntent.putExtra("currScreen","0"); //make currScreen=0; meaning very first screen				
				toUsbongDecisionTreeEngineActivityIntent.putExtra("utreeToLoad",UsbongConstants.TREE_TYPE_BUY); 								
				startActivityForResult(toUsbongDecisionTreeEngineActivityIntent,1);
			}
    	});
    	
    	//added by Mike, 20160119
    	sellButton = (Button)findViewById(R.id.sell_button);
		sellButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {		
				reset(); //generate new timestamp
				Intent toUsbongDecisionTreeEngineActivityIntent = new Intent().setClass(UsbongMainActivity.getInstance(), UsbongDecisionTreeEngineActivity.class);
				toUsbongDecisionTreeEngineActivityIntent.putExtra("currScreen","0"); //make currScreen=0; meaning very first screen				
				toUsbongDecisionTreeEngineActivityIntent.putExtra("utreeToLoad",UsbongConstants.TREE_TYPE_SELL); 								
				startActivityForResult(toUsbongDecisionTreeEngineActivityIntent,1);
			}
    	});
    	
    	requestButton = (Button)findViewById(R.id.request_button);
		requestButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {		
				reset(); //generate new timestamp
				Intent toUsbongDecisionTreeEngineActivityIntent = new Intent().setClass(UsbongMainActivity.getInstance(), UsbongDecisionTreeEngineActivity.class);
				toUsbongDecisionTreeEngineActivityIntent.putExtra("currScreen","0"); //make currScreen=0; meaning very first screen				
				toUsbongDecisionTreeEngineActivityIntent.putExtra("utreeToLoad",UsbongConstants.TREE_TYPE_REQUEST); 								
				startActivityForResult(toUsbongDecisionTreeEngineActivityIntent,1);
			}
    	});
    }
*/    
    public void reset() {
    	UsbongUtils.generateDateTimeStamp(); //create a new timestamp for this "New Entry"
    }

    //added by Mike, 29 July 2015
    //Reference: http://stackoverflow.com/questions/10407159/how-to-manage-startactivityforresult-on-android;
    //last accessed: 29 Sept. 2015; answer by Nishant, 2 May 2012; edited by Daniel Nugent, 9 July 2015
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 1) {
            if(resultCode == RESULT_OK){
            	if (myProgressDialog!=null) { 
            		myProgressDialog.dismiss();
            	}
//                String result=data.getStringExtra("result");
            }
            if (resultCode == RESULT_CANCELED) {
                //Write your code if there's no result
            }            
        }                    
    }//onActivityResult

    //added by Mike, July 2, 2015
    @Override
	public void onBackPressed() {
    	//Reference: http://stackoverflow.com/questions/11495188/how-to-put-application-to-background
    	//; last accessed: 14 April 2015, answer by: JavaCoderEx
    	Intent i = new Intent(Intent.ACTION_MAIN);
        i.addCategory(Intent.CATEGORY_HOME);
        startActivity(i);    
    }
    
    //added by Mike, 25 Sept. 2015
	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		MenuInflater inflater = getMenuInflater();
		inflater.inflate(R.menu.standard_menu, menu);
		
		//added by Mike, 20170525
		UsbongUtils.cartIcon = menu.findItem(R.id.cart).setIcon(UsbongUtils.cartIconDrawableResourceId);		

		return super.onCreateOptionsMenu(menu); 
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item)
	{		
		switch(item.getItemId())
		{
/*		
			case(R.id.settings):
				//Reference: http://stackoverflow.com/questions/16954196/alertdialog-with-checkbox-in-android;
				//last accessed: 20160408; answer by: kamal; edited by: Empty2K12
				final CharSequence[] items = {UsbongConstants.AUTO_NARRATE_STRING, UsbongConstants.AUTO_PLAY_STRING, UsbongConstants.AUTO_LOOP_STRING};
				// arraylist to keep the selected items
				UsbongDecisionTreeEngineActivity.selectedSettingsItems=new ArrayList<Integer>();
				
				//check saved settings
				if (UsbongUtils.IS_IN_AUTO_NARRATE_MODE) {					
					UsbongDecisionTreeEngineActivity.selectedSettingsItems.add(UsbongConstants.AUTO_NARRATE);			
				}
				if (UsbongUtils.IS_IN_AUTO_PLAY_MODE) {
					UsbongDecisionTreeEngineActivity.selectedSettingsItems.add(UsbongConstants.AUTO_PLAY);	
					UsbongDecisionTreeEngineActivity.selectedSettingsItems.add(UsbongConstants.AUTO_NARRATE); //if AUTO_PLAY is checked, AUTO_NARRATE should also be checked
		    	}	        				
				if (UsbongUtils.IS_IN_AUTO_LOOP_MODE) {					
					UsbongDecisionTreeEngineActivity.selectedSettingsItems.add(UsbongConstants.AUTO_LOOP);			
				}
			    
				UsbongDecisionTreeEngineActivity.selectedSettingsItemsInBoolean = new boolean[items.length];
			    for(int k=0; k<items.length; k++) {
			    	UsbongDecisionTreeEngineActivity.selectedSettingsItemsInBoolean[k] = false;			    		
			    }
			    for(int i=0; i<UsbongDecisionTreeEngineActivity.selectedSettingsItems.size(); i++) {
			    	UsbongDecisionTreeEngineActivity.selectedSettingsItemsInBoolean[UsbongDecisionTreeEngineActivity.selectedSettingsItems.get(i)] = true;
			    }
			    		    
			    inAppSettingsDialog = new AlertDialog.Builder(this)
				.setTitle("Settings")
				.setMultiChoiceItems(items, UsbongDecisionTreeEngineActivity.selectedSettingsItemsInBoolean, new DialogInterface.OnMultiChoiceClickListener() {
				    @Override
				    public void onClick(DialogInterface dialog, int indexSelected, boolean isChecked) {
				    	Log.d(">>>","onClick");

				    	if (isChecked) {
				            // If the user checked the item, add it to the selected items
				    		UsbongDecisionTreeEngineActivity.selectedSettingsItems.add(indexSelected);
				            if ((indexSelected==UsbongConstants.AUTO_PLAY) 
					        		&& !UsbongDecisionTreeEngineActivity.selectedSettingsItems.contains(UsbongConstants.AUTO_NARRATE)) {
				                final ListView list = inAppSettingsDialog.getListView();
				                list.setItemChecked(UsbongConstants.AUTO_NARRATE, true);
				            }				           
				        } else if (UsbongDecisionTreeEngineActivity.selectedSettingsItems.contains(indexSelected)) {
				        	if ((indexSelected==UsbongConstants.AUTO_NARRATE) 
				        		&& UsbongDecisionTreeEngineActivity.selectedSettingsItems.contains(UsbongConstants.AUTO_PLAY)) {
				                final ListView list = inAppSettingsDialog.getListView();
				                list.setItemChecked(indexSelected, false);
				        	}
				        	else {        	
					            // Else, if the item is already in the array, remove it
				        		UsbongDecisionTreeEngineActivity.selectedSettingsItems.remove(Integer.valueOf(indexSelected));
				        	}
				        }
				        
				        //updated selectedSettingsItemsInBoolean
					    for(int k=0; k<items.length; k++) {
					    	UsbongDecisionTreeEngineActivity.selectedSettingsItemsInBoolean[k] = false;			    		
					    }
					    for(int i=0; i<UsbongDecisionTreeEngineActivity.selectedSettingsItems.size(); i++) {
					    	UsbongDecisionTreeEngineActivity.selectedSettingsItemsInBoolean[UsbongDecisionTreeEngineActivity.selectedSettingsItems.get(i)] = true;
					    }
				    }
				}).setPositiveButton("OK", new DialogInterface.OnClickListener() {
				    @Override
				    public void onClick(DialogInterface dialog, int id) {
				    	 try {	    	
				 			InputStreamReader reader = UsbongUtils.getFileFromSDCardAsReader(UsbongUtils.BASE_FILE_PATH + "usbong.config");	
				 			BufferedReader br = new BufferedReader(reader);    		
				 	    	String currLineString;        	

				 	    	//write first to a temporary file
							PrintWriter out = UsbongUtils.getFileFromSDCardAsWriter(UsbongUtils.BASE_FILE_PATH + "usbong.config" +"TEMP");

				 	    	while((currLineString=br.readLine())!=null)
				 	    	{ 	
				 	    		Log.d(">>>", "currLineString: "+currLineString);
								if ((currLineString.contains("IS_IN_AUTO_NARRATE_MODE="))
								|| (currLineString.contains("IS_IN_AUTO_PLAY_MODE="))
								|| (currLineString.contains("IS_IN_AUTO_LOOP_MODE="))) {
									continue;
								}	
								else {
									out.println(currLineString);			 	    		
								}
				 	    	}	        				

							for (int i=0; i<items.length; i++) {
								Log.d(">>>>", i+"");
								if (UsbongDecisionTreeEngineActivity.selectedSettingsItemsInBoolean[i]==true) {
									if (i==UsbongConstants.AUTO_NARRATE) {
							    		out.println("IS_IN_AUTO_NARRATE_MODE=ON");
							    		UsbongUtils.IS_IN_AUTO_NARRATE_MODE=true;							
									}								
									else if (i==UsbongConstants.AUTO_PLAY) {
							    		out.println("IS_IN_AUTO_PLAY_MODE=ON");
							    		UsbongUtils.IS_IN_AUTO_PLAY_MODE=true;						
									}	
									else if (i==UsbongConstants.AUTO_LOOP) {
							    		out.println("IS_IN_AUTO_LOOP_MODE=ON");
							    		UsbongUtils.IS_IN_AUTO_LOOP_MODE=true;						
									}
								}
								else {
									if (i==UsbongConstants.AUTO_NARRATE) {
							    		out.println("IS_IN_AUTO_NARRATE_MODE=OFF");
							    		UsbongUtils.IS_IN_AUTO_NARRATE_MODE=false;															
									}							
									else if (i==UsbongConstants.AUTO_PLAY) {
							    		out.println("IS_IN_AUTO_PLAY_MODE=OFF");
							    		UsbongUtils.IS_IN_AUTO_PLAY_MODE=false;	
									}
									else if (i==UsbongConstants.AUTO_LOOP) {
							    		out.println("IS_IN_AUTO_LOOP_MODE=OFF");
							    		UsbongUtils.IS_IN_AUTO_LOOP_MODE=false;	
									}
								}				
							}					
					    	out.close(); //remember to close
					    	
					    	//copy temp file to actual usbong.config file
				 			InputStreamReader reader2 = UsbongUtils.getFileFromSDCardAsReader(UsbongUtils.BASE_FILE_PATH + "usbong.config"+"TEMP");	
				 			BufferedReader br2 = new BufferedReader(reader2);    		
				 	    	String currLineString2;        	

				 	    	//write to actual usbong.config file
							PrintWriter out2 = UsbongUtils.getFileFromSDCardAsWriter(UsbongUtils.BASE_FILE_PATH + "usbong.config");

				 	    	while((currLineString2=br2.readLine())!=null)
				 	    	{ 	
								out2.println(currLineString2);			 	    		
				 	    	}			 	    	
				 	    	out2.close();
				 	    	
				 	    	UsbongUtils.deleteRecursive(new File(UsbongUtils.BASE_FILE_PATH + "usbong.config"+"TEMP"));
				 		}
				 		catch(Exception e) {
				 			e.printStackTrace();
				 		}			 		
				    }
				}).setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
				    @Override
				    public void onClick(DialogInterface dialog, int id) {
				        //  Your code when user clicked on Cancel
				    }
				}).create();
				inAppSettingsDialog.show();
					return true;
*/					
			case(R.id.cart): //added by Mike, 20170427
				if ((UsbongUtils.itemsInCart==null) || (UsbongUtils.itemsInCart.isEmpty())) {
			    	AlertDialog.Builder emptyCartAlertDialog = new AlertDialog.Builder(UsbongMainActivity.this).setTitle("Your Shopping Cart");
					TextView tv = new TextView(this);
					tv.setText("\nIt is currently empty.");
					tv.setGravity(Gravity.CENTER_HORIZONTAL);
					tv.setTextSize(16);
					emptyCartAlertDialog.setView(tv);
					emptyCartAlertDialog.setPositiveButton("OK", new DialogInterface.OnClickListener() {
						@Override
						public void onClick(DialogInterface dialog, int which) {
						}
					}).show();
				}
				else {
					finish();
					//added by Mike, 20170216
					Intent toCartActivityIntent = new Intent().setClass(getInstance(), CartActivity.class);
	//				toCartActivityIntent.putExtra("newSellActivity", true); //added by Mike, 20170328
					toCartActivityIntent.putExtra("activityCaller", UsbongConstants.USBONG_MAIN_ACTIVITY); //added by Mike, 20170525	            				
					toCartActivityIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
					startActivity(toCartActivityIntent);
				}
				return true;
			case(R.id.sell): //added by Mike, 20170308
				finish();
				//added by Mike, 20170216
				Intent toSellActivityIntent = new Intent().setClass(getInstance(), SellActivity.class);
				toSellActivityIntent.putExtra("newSellActivity", true); //added by Mike, 20170328
				toSellActivityIntent.putExtra("activityCaller", UsbongConstants.USBONG_MAIN_ACTIVITY); //added by Mike, 20170525	            				
				toSellActivityIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
				startActivity(toSellActivityIntent);
				return true;
			case(R.id.request):
				finish();
				//added by Mike, 20170216
				Intent toRequestActivityIntent = new Intent().setClass(getInstance(), RequestActivity.class);
				toRequestActivityIntent.putExtra("newRequestActivity", true); //added by Mike, 20170330
				toRequestActivityIntent.putExtra("activityCaller", UsbongConstants.USBONG_MAIN_ACTIVITY); //added by Mike, 20170525	            				
				toRequestActivityIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
				startActivity(toRequestActivityIntent);
				return true;
			case(R.id.about):
		    	new AlertDialog.Builder(UsbongMainActivity.this).setTitle("About")
				.setMessage(UsbongUtils.readTextFileInAssetsFolder(UsbongMainActivity.this,"credits.txt")) //don't add a '/', otherwise the file would not be found
				.setPositiveButton("OK", new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int which) {
					}
				}).show();
				return true;
			case(R.id.account):
				final EditText firstName = new EditText(this);
				firstName.setHint("First Name");
				final EditText surName = new EditText(this);
				surName.setHint("Surname");
				final EditText contactNumber = new EditText(this);
				contactNumber.setHint("Contact Number");
				contactNumber.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL);
	/*				
				//added by Mike, 20170223
				final RadioGroup preference = new RadioGroup(this);
				preference.setOrientation(RadioGroup.HORIZONTAL);
				
				RadioButton meetup = new AppCompatRadioButton(this);
				meetup.setText("Meet-up");
				preference.addView(meetup);
								
				RadioButton shipping = new AppCompatRadioButton(this);
				shipping.setText("Shipping");
				preference.addView(shipping);				
	*/				
				final EditText shippingAddress = new EditText(this);
				shippingAddress.setHint("Shipping Address");
				shippingAddress.setMinLines(5);
	
				//added by Mike, 20170223
				final RadioGroup modeOfPayment = new RadioGroup(this);
				modeOfPayment.setOrientation(RadioGroup.VERTICAL);
	/*				
				RadioButton cashUponMeetup = new AppCompatRadioButton(this);
				cashUponMeetup.setText("Cash upon meet-up");
				modeOfPayment.addView(cashUponMeetup);
	*/									
				RadioButton bankDeposit = new AppCompatRadioButton(this);
				bankDeposit.setText("Bank Deposit");
				modeOfPayment.addView(bankDeposit);
	/*
				RadioButton peraPadala = new AppCompatRadioButton(this);
				peraPadala.setText("Pera Padala");
				modeOfPayment.addView(peraPadala);
	*/
				RadioButton paypal = new AppCompatRadioButton(this);
				paypal.setText("PayPal");
				modeOfPayment.addView(paypal);
				
			    //Reference: http://stackoverflow.com/questions/23024831/android-shared-preferences-example
		        //; last accessed: 20150609
		        //answer by Elenasys
		        //added by Mike, 20150207
		        SharedPreferences prefs = getSharedPreferences(UsbongConstants.MY_ACCOUNT_DETAILS, MODE_PRIVATE);
		        if (prefs!=null) {
		          firstName.setText(prefs.getString("firstName", ""));//"" is the default value.
		          surName.setText(prefs.getString("surname", "")); //"" is the default value.
		          contactNumber.setText(prefs.getString("contactNumber", "")); //"" is the default value.
	/*
		          //added by Mike, 20170223
		          ((RadioButton)preference.getChildAt(prefs.getInt("preference", UsbongConstants.defaultPreference))).setChecked(true);
	*/				  		          
		          shippingAddress.setText(prefs.getString("shippingAddress", "")); //"" is the default value.
		          
			      //added by Mike, 20170223				  
		          ((RadioButton)modeOfPayment.getChildAt(prefs.getInt("modeOfPayment", UsbongConstants.defaultModeOfPayment))).setChecked(true);
		        }
				
				LinearLayout ll=new LinearLayout(this);
				ll.setOrientation(LinearLayout.VERTICAL);
				ll.addView(firstName);
				ll.addView(surName);
				ll.addView(contactNumber);
	/*				ll.addView(preference);*/
				ll.addView(shippingAddress);				
				ll.addView(modeOfPayment);
	
				new AlertDialog.Builder(this).setTitle("My Account")
				.setView(ll)
				.setNegativeButton("Cancel",  new DialogInterface.OnClickListener() {
				    public void onClick(DialogInterface dialog, int id) {
				        //ACTION
				    }
				})
				.setPositiveButton("Save & Exit",  new DialogInterface.OnClickListener() {
				    public void onClick(DialogInterface dialog, int id) {
				        //ACTION
				        //Reference: http://stackoverflow.com/questions/23024831/android-shared-preferences-example
				        //; last accessed: 20150609
				        //answer by Elenasys
				        //added by Mike, 20170207
				        SharedPreferences.Editor editor = getSharedPreferences(UsbongConstants.MY_ACCOUNT_DETAILS, MODE_PRIVATE).edit();
				        editor.putString("firstName", firstName.getText().toString());
				        editor.putString("surname", surName.getText().toString());
				        editor.putString("contactNumber", contactNumber.getText().toString());
	/*
				        for (int i=0; i< preference.getChildCount(); i++) {
				        	if (((RadioButton)preference.getChildAt(i)).isChecked()) {
				        		currPreference=i;
				        	}
				        }
				        editor.putInt("preference", currPreference); //added by Mike, 20170223				        
	*/				        
				        editor.putString("shippingAddress", shippingAddress.getText().toString());
	
				        for (int i=0; i< modeOfPayment.getChildCount(); i++) {
				        	if (((RadioButton)modeOfPayment.getChildAt(i)).isChecked()) {
				        		currModeOfPayment=i;
				        	}
				        }
				        editor.putInt("modeOfPayment", currModeOfPayment); //added by Mike, 20170223
				        editor.commit();		
/*				        
				        if (currScreen!=BUY_SCREEN) {
					        //added by Mike, 20170222
					        setContentView(R.layout.account);	
					        init();				        	
				        }
*/				        
				    }
				}).show();
				return true;
			case android.R.id.home: //added by Mike, 22 Sept. 2015
	/*//commented out by Mike, 201702014; UsbongDecisionTreeEngineActivity is already the main menu				
				processReturnToMainMenuActivity();
	*/				    	//added by Mike, 20170216
				//return to UsbongDecisionTreeEngineActivity
				//edited by Mike, 20170525
				finish();
				Intent toMainActivityIntent = new Intent(getInstance(), UsbongMainActivity.class);
				toMainActivityIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP); 
				startActivity(toMainActivityIntent);
		        return true;
			default:
				return super.onOptionsItemSelected(item);
		}
	}

	private class CustomDataAdapter extends ArrayAdapter<String>
	{
		private ArrayList<String> items;
		
		public CustomDataAdapter(Context context, int textViewResourceId, ArrayList<String> items) {
            super(context, textViewResourceId, items);
            this.items = items;            
		}
		
		//added by Mike, 20170203
		public void sort() {
//			Collections.sort(items);
			
			//Reference: http://stackoverflow.com/questions/8908549/sorting-of-listview-by-name-of-the-product-using-custom-adaptor;
			//last accessed: 2 Jan. 2014; answer by Alex Lockwood
			Collections.sort(items, new Comparator<String>() {
			    public int compare(String arg0, String arg1) {
			        return arg0.compareTo(arg1);
			    }
			});			
		}
		
		@Override
		public View getView(final int position, View convertView, ViewGroup parent) {
                View v = convertView;
                if (v == null) {
                    LayoutInflater vi = (LayoutInflater)getSystemService(Context.LAYOUT_INFLATER_SERVICE);

                    switch (currCategory) {
                    	case UsbongConstants.ITEMS_LIST_COMBOS:
                            v = vi.inflate(R.layout.tree_loader_alternative, null);
                            break;
                        default:
/*                    	case UsbongConstants.ITEMS_LIST_BOOKS:
                    	case UsbongConstants.ITEMS_LIST_TEAS:*/
                            v = vi.inflate(R.layout.tree_loader, null);
                        	break;                            
                    }
/*                    
                    if (currCategory==UsbongConstants.ITEMS_LIST_BOOKS) {
                        v = vi.inflate(R.layout.tree_loader, null);
                    }
                    else { //combo
                        v = vi.inflate(R.layout.tree_loader_alternative, null);
                    }
*/                    
                }
                final String o = items.get(position);
                if (o != null) {
                	try {       
                    	TextView dataCurrentTextView = (TextView)v.findViewById(R.id.tree_item);
                    	//edited by Mike, 20170522
                    	final String s;
                    	String tempS;
	            		//Reference: http://www.anddev.org/tinytut_-_get_resources_by_name__getidentifier_-t460.html; last accessed 14 Sept 2011
	                    Resources myRes = instance.getResources();
	                    final String imageFileName;
	                    
                    	switch(currCategory) {
			    			case UsbongConstants.ITEMS_LIST_BEVERAGES:
/*			    				
		                    	s = o.toString()
                    			.replace("Name:", "<b>Name:</b>")
            					.replace("\nPrice:", "\n<b>Price:</b>")
            					.replace("\nLanguage:", "\n<b>Language:</b>")
            					.replace("\n", "<br>");
//            					.substring(o.indexOf("T"));

			                    imageFileName = o.toString().substring(0, o.toString().indexOf("\nPrice:"))
			                    		.replace("Name: ","")
			                    		.replace("’","")
			                    		.replace("'","")
			                    		.replace(":","")+".jpg"; //edited by Mike, 20170202
*/			                    		
			    				tempS = o.toString().replace("\n", "<br>");
			    				s = tempS.subSequence(0, tempS.indexOf("MerchantName: ")).toString();
			    				imageFileName = o.toString().substring(0, o.toString().indexOf("</b>"))
		                    		.replace("<b>","")
		                    		.replace("’","")
		                    		.replace("'","")
		                    		.replace(":","")+".jpg"; //edited by Mike, 20170202
			    				break;
			    			default:
/*
			    				s = o.toString()
                    			.replace("Title:", "<b>Title:</b>")
            					.replace("\nAuthor:", "\n<b>Author:</b>")
            					.replace("\nPrice:", "\n<b>Price:</b>")
//            					.replace("\nDetails:", "\n<b>Details:</b>")
            					.replace("\nLanguage:", "\n<b>Language:</b>")
            					.replace("\n", "<br>");
//            					.substring(o.indexOf("T"));

			                    imageFileName = o.toString().substring(0, o.toString().indexOf("\nAuthor:"))
			                    		.replace("Title: ","")
			                    		.replace("’","")
			                    		.replace("'","")
			                    		.replace(":","")+".jpg"; //edited by Mike, 20170202
*/			                    		
/*			    				
			    				s = o.toString()
		            				.replace("\n", "<br>")
		            				.subSequence(0, o.indexOf("MerchantName: ")).toString();
*/
			    				tempS = o.toString().replace("\n", "<br>");
			    				s = tempS.subSequence(0, tempS.indexOf("MerchantName: ")).toString();
			                    imageFileName = o.toString().substring(0/*o.indexOf("T")*/, o.toString().indexOf("</b>"))
			                    		.replace("<b>","")
			                    		.replace("’","")
			                    		.replace("'","")
			                    		.replace(":","")+".jpg"; //edited by Mike, 20170202
			    				break;
                    	}
	                    final Drawable myDrawableImage = Drawable.createFromStream(myRes.getAssets().open(imageFileName), null); //edited by Mike, 20170202
	            		final ImageView image = (ImageView) v.findViewById(R.id.tree_item_image_view);
		            	
                        final Button merchantNameButton = (Button)v.findViewById(R.id.merchant_button);
                        int index = o.indexOf("MerchantName: ")+"MerchantName: ".length();
                        merchantNameButton.setText("☗ "+o.toString().substring(
                        								index)
                        		);
                        merchantNameButton.setOnClickListener(new OnClickListener() {
                            @Override
                            public void onClick(View v) {
                            	loadMerchantStore(merchantNameButton.getText().toString());
                            	
                            }
                        });
	            		
	                	dataCurrentTextView.setText(Html.fromHtml(s));
//	                	dataCurrentTextView.setText(o.toString());
	                	dataCurrentTextView.setOnClickListener(new OnClickListener() {
	            			@Override
	            			public void onClick(View v) {
/*	            				
	            				//added by Mike, 20170203
	                        	setVariableOntoMyUsbongVariableMemory(UsbongConstants.ITEM_VARIABLE_NAME, s);
	            				setVariableOntoMyUsbongVariableMemory(UsbongConstants.ITEM_IMAGE_NAME, imageFileName); //added by Mike, 20160203
	                    		image.setImageDrawable(myDrawableImage);		                    		
	                        	initParser(UsbongConstants.TREE_TYPE_BUY);           				
*/
                				//added by Mike, 20170216
	            				Intent toBuyActivityIntent = new Intent().setClass(getInstance(), BuyActivity.class);
	            				toBuyActivityIntent.putExtra(UsbongConstants.ITEM_VARIABLE_NAME, s);
	            				toBuyActivityIntent.putExtra(UsbongConstants.ITEM_IMAGE_NAME, imageFileName);
	            				toBuyActivityIntent.putExtra(UsbongConstants.ITEM_IMAGE_NAME, imageFileName);	            				
	            				toBuyActivityIntent.putExtra(UsbongConstants.MERCHANT_NAME, merchantNameButton.getText().toString()); //added by Mike, 20170528        				
	            				startActivityForResult(toBuyActivityIntent,1);
	            			}
	                	});
                		image.setImageDrawable(myDrawableImage);                		
/*
                		//added by Mike, 20170203
                		//make the image icon in the list smaller
                		image.setAdjustViewBounds(true);
                		image.setMaxHeight(100);
                		image.setMaxWidth(100);                		
*/                		
                		image.setOnClickListener(new OnClickListener() {
                			@Override
                			public void onClick(View v) {
/*
                				//added by Mike, 20170203
                            	setVariableOntoMyUsbongVariableMemory(UsbongConstants.ITEM_VARIABLE_NAME, s);
                				setVariableOntoMyUsbongVariableMemory(UsbongConstants.ITEM_IMAGE_NAME, imageFileName); //added by Mike, 20160203
                        		image.setImageDrawable(myDrawableImage);	
                				initParser(UsbongConstants.TREE_TYPE_BUY); //added by Mike, 20160202          				                	
*/
                				//added by Mike, 20170216
	            				Intent toBuyActivityIntent = new Intent().setClass(getInstance(), BuyActivity.class);
	            				toBuyActivityIntent.putExtra(UsbongConstants.ITEM_VARIABLE_NAME, s);
	            				toBuyActivityIntent.putExtra(UsbongConstants.ITEM_IMAGE_NAME, imageFileName);
	            				toBuyActivityIntent.putExtra("activityCaller", UsbongConstants.USBONG_MAIN_ACTIVITY); //added by Mike, 20170525	            				
	            				startActivityForResult(toBuyActivityIntent,1);
                			}
                		});
                	}
	            	catch(Exception e) {
	            		e.printStackTrace();
	            	}
                }
                return v;
        }
	}
}