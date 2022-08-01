INSERT INTO k8s_policy_results (resource_id, execution_time, framework, check_id, title, context, namespace,
                               resource_name, status)
select DISTINCT uid                                   AS resource_id,
                :'execution_time'::timestamp          AS execution_time,
                :'framework'                          AS framework,
                :'check_id'                           AS check_id,
                'Pod service account tokens disabled' AS title,
                context                               AS context,
                namespace                             AS namespace,
                k8s_core_pods.name                    AS resource_name,
                CASE
                    WHEN
                            k8s_core_pod_containers.security_context ->> 'runAsNonRoot' IS DISTINCT FROM 'true'
                        THEN 'fail'
                    ELSE 'pass'
                    END                               AS status
FROM k8s_core_pod_containers
         JOIN k8s_core_pods ON k8s_core_pods.cq_id = k8s_core_pod_containers.pod_cq_id