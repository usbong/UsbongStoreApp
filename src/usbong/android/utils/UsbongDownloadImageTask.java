package usbong.android.utils;

import java.io.InputStream;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;

//Reference: https://stackoverflow.com/questions/2471935/how-to-load-an-imageview-by-url-in-android;
//last accessed: 20180216;
//answer by: Android Developer; 
//edited by: abidibo

public class UsbongDownloadImageTask extends AsyncTask<String, Void, Bitmap> {
//    ImageView bmImage;
    String urldisplay;
    
    public UsbongDownloadImageTask() {
    }
/*
    public DownloadImageTask(ImageView bmImage) {
        this.bmImage = bmImage;
    }
*/
    protected Bitmap doInBackground(String... urls) {
    	 urldisplay = urls[0];
         Bitmap mIcon11 = null;
         try {
             InputStream in = new java.net.URL(urldisplay).openStream();
             mIcon11 = BitmapFactory.decodeStream(in);
         } catch (Exception e) {
             Log.e("Error", e.getMessage());
             e.printStackTrace();
         }
         return mIcon11;
    	
/*    	
        String urldisplay = urls[0];
        Bitmap mIcon_val = null;
        try {
            InputStream in = new java.net.URL(urldisplay).openStream();
//            mIcon11 = BitmapFactory.decodeStream(in);
            mIcon_val = BitmapFactory.decodeStream(newurl.openConnection().getInputStream()); 

            
//            URL newurl = new URL(photo_url_str); 
//            mIcon_val = BitmapFactory.decodeStream(newurl.openConnection().getInputStream()); 
//            profile_photo.setImageBitmap(mIcon_val);
                        
        } catch (Exception e) {
            Log.e("Error", e.getMessage());
            e.printStackTrace();
        }
        return mIcon_val;
*/        
    }

    protected void onPostExecute(Bitmap result) {
//        bmImage.setImageBitmap(result);
        UsbongUtils.storeImageInSDCard(urldisplay, result);    	
    }
}