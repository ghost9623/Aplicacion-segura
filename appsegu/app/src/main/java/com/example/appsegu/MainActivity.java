package com.example.appsegu;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {

    private EditText usu;
    private EditText nombre;
    private EditText patern;
    private EditText matern;
    private EditText buscar1;
    private Button regis;
    private Button buscar;

    RequestQueue requestQueue;


    public void app()
    {
          usu=(EditText) findViewById(R.id.usu);
          nombre=(EditText)findViewById(R.id.nom);
          patern=(EditText)findViewById(R.id.Papellido);
          matern=(EditText)findViewById(R.id.Aapellido);
           buscar1=(EditText)findViewById(R.id.Buscar);
           regis=(Button)findViewById(R.id.reg);
           buscar=(Button)findViewById(R.id.bus);

           buscar.setOnClickListener(new View.OnClickListener() {
               @Override
               public void onClick(View view) {
                 busacardatos("http://192.168.1.241/seguridad/buscar.php?usu="+buscar1.getText()+"");
               }
           });


        regis.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent registro =new Intent(MainActivity.this,MainActivity2.class);
                startActivity(registro);
            }
        });
    }
    private void  busacardatos(String URL)
    {

        JsonArrayRequest jsonArrayRequest=new JsonArrayRequest(URL, new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                JSONObject jsonObject = null;

                for (int i = 0; i < response.length(); i++) {
                    try {
                        jsonObject = response.getJSONObject(i);

                        usu.setText(jsonObject.getString("usu"));
                        nombre.setText(jsonObject.getString("nombre"));
                        patern.setText(jsonObject.getString("Papellido"));
                        matern.setText(jsonObject.getString("Aapellido"));

                    } catch (JSONException e) {
                        Toast.makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
                    }

                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(),"error de conexion",Toast.LENGTH_LONG).show();
            }
        });

        requestQueue=Volley.newRequestQueue(this);
        requestQueue.add(jsonArrayRequest);

    }
    @Override





    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        app();


    }
}