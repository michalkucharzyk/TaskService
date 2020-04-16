<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Task;
use GuzzleHttp\Client;

class TaskController extends Controller
{
    public function getAll(Request $request)
    {

        $token = $request->header('Authorization');

        if (empty($token))
            return response()->json(['success' => false, 'authorization' => false, 'messages' => 'Token is empty'], 200);

        $status = TaskController::authUsers($token);
        if ($status['authorization'] == false)
        {
            return response()->json(['success' => false, 'authorization' => false], 200);
        } else
        {
            $tasks = Task::where('id_user', $status['id_user'])->get();
            $data = $dataReturn = array();
            foreach ($tasks as $key => $value)
            {
                $data[$key] = [
                    'id' => $value->id,
                    'id_user' => $value->id_user,
                    'name' => $value->name,
                    'description' => $value->description,
                    'start_task' => $value->start_task,
                    'end_task' => $value->end_task,
                    'status' => $value->status,
                    'created_at' => $value->created_at,
                    'updated_at' => $value->updated_at,
                ];
            }
            $dataReturn['success'] = true;
            $dataReturn['count'] = count($data);
            $dataReturn['data'] = $data;
            return response()->json($dataReturn, 200);
        }
    }

    public function update(Request $request)
    {

        $token = $request->header('Authorization');

        if (empty($token))
            return response()->json(['success' => false, 'authorization' => false, 'messages' => 'Token is empty'], 200);

        $status = TaskController::authUsers($token);

        if ($status['authorization'] == false)
        {
            return response()->json(['success' => false, 'authorization' => false], 200);
        } else
        {
            $request->validate([
                'id' => 'required|int',
            ]);
            Task::where('id', $request->id)->where('id_user', $status['id_user'])
                ->update($request->all());
            return response()->json(['success' => true, 'update_id' => $request->id], 200);
        }
    }

    public function insert(Request $request)
    {
        $token = $request->header('Authorization');

        if (empty($token))
            return response()->json(['success' => false, 'authorization' => false, 'messages' => 'Token is empty'], 200);

        $status = TaskController::authUsers($token);

        if ($status['authorization'] == false)
        {
            return response()->json(['success' => false, 'authorization' => false], 200);
        } else
        {
            $request->validate([
                'name' => 'required|string',
                'description' => 'required|string',
                'start_task' => 'required|string',
                'end_task' => 'required|string',
                'status' => 'required|int'
            ]);

            $task = new Task();
            $task->id_user = $status['id_user'];
            $task->name = $request->name;
            $task->description = $request->description;
            $task->start_task = $request->start_task;
            $task->end_task = $request->end_task;
            $task->status = $request->status;
            $task->timestamps;
            $task->save();

            return response()->json(['success' => true, 'insert_id' => $task->id], 200);
        }
    }

    public function delete(Request $request)
    {
        $token = $request->header('Authorization');
        if (empty($token))
            return response()->json(['success' => false, 'authorization' => false, 'messages' => 'Token is empty'], 200);

        $status = TaskController::authUsers($token);

        if ($status['authorization'] == false)
        {
            return response()->json(['success' => false, 'authorization' => false], 200);
        } else
        {
            $task = Task::where('id', $request->id)->where('id_user', $status['id_user'])->first();
            if ($task)
            {
                $task->delete();
            }
            return response()->json(['success' => true, 'delete_id' => $request->id], 200);
        }
    }

    public static function authUsers($token)
    {

        $httpClient = new Client(); // version 6.x
        $request = $httpClient->request('GET', 'http://127.0.0.1:8001/api/auth/user', ['headers' => [
            'Authorization' => $token,
            'Accept' => 'application/json',
            'content-type' => 'application/json'
        ]]);

        if ($request->getStatusCode() == 200)
        {
            $data = json_decode($request->getBody());
            if (!empty($data->id))
            {
                return $data = [
                    'id_user' => $data->id,
                    'authorization' => true,
                ];
            } else
            {
                return $data = [
                    'authorization' => false,
                ];
            }
        } else
        {
            return $data = [
                'authorization' => false,
            ];
        }
    }


    public function getAllReact(Request $request)
    {
        $tasks = Task::where('id_user', 1)->get();
        $data = $dataReturn = array();
        foreach ($tasks as $key => $value)
        {
            $data[$key] = [
                'id' => $value->id,
                'id_user' => $value->id_user,
                'name' => $value->name,
                'description' => $value->description,
                'start_task' => $value->start_task,
                'end_task' => $value->end_task,
                'status' => $value->status,
                'created_at' => $value->created_at,
                'updated_at' => $value->updated_at,
            ];
        }
        $dataReturn['success'] = true;
        $dataReturn['count'] = count($data);
        $dataReturn['data'] = $data;
        return response()->json($dataReturn, 200);

    }

    public function deleteReact(Request $request)
    {
        $task = Task::where('id', $request->id)->first();
        if ($task)
        {
            $task->delete();
        }
        return response()->json(['success' => true, 'delete_id' => $request->id], 200);

    }

    public function deleteAllTask(Request $request)
    {
        $tasks = Task::get();
        if(!empty($tasks))
        {
            foreach($tasks as $task)
            {
                $task->delete();
            }
        }
        return response()->json(['success' => true], 200);

    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function insertReact(Request $request)
    {

        $task = new Task();
        $task->id_user = 1;
        $task->name = $request->name;
        $task->description = 'xdsadsdasasdasd';
        $task->start_task = '2019-12-24 11:26:52';
        $task->end_task = '2020-01-15 08:33:51';
        $task->status = 1;
        $task->timestamps;
        $task->save();

        $dataReturn['success'] = true;
        return $task;

    }

    public function updateStatusTaskReact(Request $request)
    {

        switch ($request->status)
        {
            case true:
                $request->status = 1;
                break;
            case false:
                $request->status = 0;
                break;
        }

        $task = Task::where('id', $request->route('id'))->update(['status' => $request->status]);
        $task = Task::find( $request->route('id'));
        return response()->json(['success' => true, 'task' => $task], 200);

    }


}
