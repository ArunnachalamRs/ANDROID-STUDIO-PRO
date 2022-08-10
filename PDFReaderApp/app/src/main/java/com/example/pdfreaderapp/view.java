package com.example.pdfreaderapp;

import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

public class view extends RecyclerView.ViewHolder {
    public TextView textView;
    public CardView cardView;
    public view(@NonNull View itemView) {
        super(itemView);
        textView=itemView.findViewById(R.id.text);
        cardView=itemView.findViewById(R.id.card);



    }
}
