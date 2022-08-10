package com.example.pdfreaderapp;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.io.File;
import java.util.List;

public class adapter extends RecyclerView.Adapter<view> {

    private Context context;
    private List<File> fileList;
    private OnPdfSelectListener listener;

    public adapter(Context context, List<File> fileList,OnPdfSelectListener listener) {
        this.context = context;
        this.fileList = fileList;
        this.listener=listener;
    }

    @NonNull
    @Override
    public view onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new view(LayoutInflater.from(context).inflate(R.layout.ele,parent,false));
    }

    @Override
    public void onBindViewHolder(@NonNull view holder, int position) {

        holder.textView.setText(fileList.get(position).getName());
        holder.textView.setSelected(true);
        holder.cardView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onPdfSelected(fileList.get(position));
            }
        });

    }

    @Override
    public int getItemCount() {
        return fileList.size();
    }
}
