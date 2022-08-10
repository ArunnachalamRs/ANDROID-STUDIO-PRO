package com.example.pdfreaderapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.Manifest;
import android.content.Intent;
import android.os.Bundle;
import android.os.Environment;
import android.widget.Toast;

import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity  implements OnPdfSelectListener{
    private adapter adapter;
    private List<File> pdfList;
    private RecyclerView recyclerView;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        runtimepermission();



    }

    private void runtimepermission() {
        Dexter.withContext(MainActivity.this)
                .withPermission(Manifest.permission.READ_EXTERNAL_STORAGE)
                .withListener(new PermissionListener() {
                    @Override
                    public void onPermissionGranted(PermissionGrantedResponse permissionGrantedResponse) {
                        displayPdf();

                    }

                    @Override
                    public void onPermissionDenied(PermissionDeniedResponse permissionDeniedResponse) {
                        Toast.makeText(MainActivity.this, "Permission is required", Toast.LENGTH_SHORT).show();

                    }

                    @Override
                    public void onPermissionRationaleShouldBeShown(PermissionRequest permissionRequest, PermissionToken permissionToken) {
                        permissionToken.continuePermissionRequest();

                    }
                }).check();


    }

    public ArrayList<File>  findPdf (File file){
        ArrayList<File> arrayList=new ArrayList<>();
        File[] files=file.listFiles();
        for (File singleFile:files){
            if(singleFile.isDirectory() && singleFile.isHidden()){
                arrayList.addAll(findPdf(singleFile));
            }
            else{
                if(singleFile.getName().endsWith(".pdf")){
                    arrayList.add(singleFile);
                }
            }
        }
        return arrayList;
    }


    private void displayPdf() {
        recyclerView=findViewById(R.id.rc);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new GridLayoutManager(this,3));
        pdfList=new ArrayList<>();
        pdfList.addAll(findPdf(Environment.getExternalStorageDirectory()));
        adapter=new adapter(this,pdfList,this);
        recyclerView.setAdapter(adapter);
    }

    @Override
    public void onPdfSelected(File file) {
        startActivity(new Intent(MainActivity.this,document.class)
        .putExtra("path",file.getAbsolutePath()));
    }
}