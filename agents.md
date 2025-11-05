# Agents (CodeIgniter 3) — src/agents

Dokumen singkat untuk struktur dan penggunaan "agents" yang ditempatkan di dalam folder `src/application/modules` pada proyek CodeIgniter 3 HMVC.

## Tujuan
Menampung kelas-kelas agent (service/utility) yang dipisah dari controller/model dalam struktur HMVC, dapat diakses lewat composer (PSR-4) atau manual include. Cocok untuk logika bisnis terpisah, integrasi API, worker kecil, dsb.

## Struktur direktori (disarankan)
- src/
    - application/
        - modules/
            - module_name/
                - controllers/
                - models/
                - views/

- controllers extend MY_Controller