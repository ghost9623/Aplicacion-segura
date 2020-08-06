package com.example.appsegu;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class MainActivity2 extends AppCompatActivity {

    EditText use;
     EditText contras;
     EditText nombre;
     EditText patern;
     EditText matern;
     EditText cuid;

     Button insertar;
     Button actualizar;
     Button eliminar;

     public void registrar()
     {
         use=(EditText)findViewById(R.id.uss);
         contras=(EditText)findViewById(R.id.cont);
         nombre=(EditText)findViewById(R.id.nom);
         patern=(EditText)findViewById(R.id.pater);
         matern=(EditText)findViewById((R.id.mater));
         cuid=(EditText)findViewById(R.id.ciu);

         insertar=(Button)findViewById(R.id.Reg);
         actualizar=(Button)findViewById(R.id.Act);
         eliminar=(Button)findViewById(R.id.eli);

     }


    private void app()
    {
        registrar();

        insertar=(Button)findViewById(R.id.Reg);

        insertar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
              ejecutarserver("http://192.168.1.241/seguridad/crud.php");
            }
        });


        actualizar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                actulizardatos("http://192.168.1.241/seguridad/actualizar.php");
            }
        });

        eliminar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ejecutarserver("http://192.168.1.241/seguridad/eliminar.php");
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

       app();


    }


    public void ejecutarserver(String URL)
    {
        StringRequest stringRequest=new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Toast.makeText(getApplicationContext(), "operacion exitosa", Toast.LENGTH_LONG).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
            }
        })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> pare= new HashMap<String,String>();
                pare.put("usu",use.getText().toString());
                pare.put("contra",contras.getText().toString());
                pare.put("nom",nombre.getText().toString());
                pare.put("Pap",patern.getText().toString());
                pare.put("Aap",matern.getText().toString());
                pare.put("ciu",cuid.getText().toString());



                return pare;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }


    public void eliminardatos(String URL)
    {
        StringRequest stringRequest=new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Toast.makeText(getApplicationContext(), "operacion exitosa", Toast.LENGTH_LONG).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
            }
        })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> pare= new HashMap<String,String>();

                pare.put("nom",nombre.getText().toString());




                return pare;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);

    }


    public void actulizardatos(String URL)
    {
        StringRequest stringRequest=new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Toast.makeText(getApplicationContext(), "operacion exitosa", Toast.LENGTH_LONG).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
            }
        })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> pare= new HashMap<String,String>();
                pare.put("usu",use.getText().toString());
                pare.put("contra",contras.getText().toString());
                pare.put("nom",nombre.getText().toString());
                pare.put("Pap",patern.getText().toString());
                pare.put("Aap",matern.getText().toString());
                pare.put("ciu",cuid.getText().toString());



                return pare;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
}