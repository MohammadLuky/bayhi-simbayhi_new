<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Simbayhi_model extends CI_Model
{
    public function insert_data($data, $table)
    {
        $this->db->insert($table, $data);
    }

    public function insert_data_batch($data, $table)
    {
        $this->db->insert_batch($table, $data);
    }

    public function show_data($table)
    {
        return $this->db->get($table)->result_array();
    }

    public function delete_data($table, $id_field, $id_data)
    {
        $this->db->where($id_field, $id_data);
        $this->db->delete($table);
    }

    public function getId_data($id, $table, $id_table)
    {
        return $this->db->get_where($table, [$id_table => $id])->row_array();
    }

    public function update_data($field_id_tb, $id_in_input, $table, $data)
    {
        $this->db->where($field_id_tb, $id_in_input);
        $this->db->update($table, $data);
    }

    public function checkIfExists($id_tabel, $field_id, $tabel)
    {
        $this->db->where($field_id, $id_tabel);
        $query = $this->db->get($tabel);
        return $query->num_rows() > 0;
    }

    public function count_rows($tabel)
    {
        $query = $this->db->get($tabel);
        return $query->num_rows();
    }

    public function getdata_byID($table, $get_field_id, $id)
    {
        $this->db->where($get_field_id, $id);
        return $this->db->get($table)->result_array();
    }

    public function count_by_category($field_category, $tabel, $category)
    {
        $this->db->where($field_category, $category);
        return $this->db->count_all_results($tabel);
    }

    public function getnext_data($tabel, $id_currentData, $field_id)
    {
        $this->db->where($field_id . '>', $id_currentData);
        $this->db->order_by($field_id, 'ASC');
        $this->db->limit(1);
        return $this->db->get($tabel)->row_array();
    }

    public function getdata_teratas($tabel, $nama_kolom)
    {
        $this->db->order_by($nama_kolom, 'ASC');
        $this->db->limit(1);
        return $this->db->get($tabel)->row_array();
    }

    public function generate_id($length = 12)
    {
        // $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        $characters = '0123456789'; // Hanya angka
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public function nomor_antrian()
    {
        $this->db->select_max('no_urut_antrian');
        $query = $this->db->get('psb_antrian_jadwal');
        $result = $query->row();

        return isset($result->no_urut_antrian) ? $result->no_urut_antrian + 1 : 1;
    }

    public function getsession_auth($username)
    {
        return $this->db->from('simbayhi_users')
            ->join('simbayhi_role_user', 'simbayhi_role_user.id_role=role_id', 'left')
            ->where(['username' => $username])
            ->get()
            ->row_array();
    }

    public function AllPengguna()
    {
        return $this->db->from('simbayhi_users')
            ->join('simbayhi_role_user', 'simbayhi_role_user.id_role=role_id', 'left')
            ->join('simbayhi_unit', 'simbayhi_unit.id_unit=unit_kerja_id', 'left')
            ->get()
            ->result_array();
    }

    public function Data_SubAkun($id_akun_induk)
    {
        return $this->db->from('simbayhi_data_subakun_induk')
            ->join('simbayhi_data_akun_induk', 'simbayhi_data_akun_induk.id_akun_induk=akun_induk_id', 'left')
            ->join('simbayhi_data_nomor_subakun', 'simbayhi_data_nomor_subakun.id_nomor_subakun=nomor_subakun_id', 'left')
            ->where('akun_induk_id', $id_akun_induk)
            ->order_by('id_subakun_induk', 'asc')
            ->get()
            ->result_array();
    }

    public function SubJadiInduk($id_akun_induk)
    {
        return $this->db->from('simbayhi_data_subakun_induk')
            ->join('simbayhi_data_akun_induk', 'simbayhi_data_akun_induk.id_akun_induk=akun_induk_id', 'left')
            ->join('simbayhi_data_nomor_subakun', 'simbayhi_data_nomor_subakun.id_nomor_subakun=nomor_subakun_id', 'left')
            ->where('akun_induk_id', $id_akun_induk)
            ->where('subakun_jadi_induk', 1)
            ->order_by('id_subakun_induk', 'asc')
            ->get()
            ->result_array();
    }

    public function Data_SubAkunPer_NomorSubAkun($id_akun_induk, $id_nomor_subakun)
    {
        return $this->db->from('simbayhi_data_subakun_induk')
            ->join('simbayhi_data_akun_induk', 'simbayhi_data_akun_induk.id_akun_induk=akun_induk_id', 'left')
            ->join('simbayhi_data_nomor_subakun', 'simbayhi_data_nomor_subakun.id_nomor_subakun=nomor_subakun_id', 'left')
            ->where('akun_induk_id', $id_akun_induk)
            ->where('nomor_subakun_id', $id_nomor_subakun)
            ->get()
            ->result_array();
    }
}
