CDF           
              t                 x                  y                 z                    h       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            X/cluster/scratch/klye/single_sample_structure_functions/experiments/shockvortex/template       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-067          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T151319        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           1          alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_shockvortex_dash_template_dash_shockvortex_DOT_py           �
GAMMA=1.66666666666667

r_c = 0.05
alpha = 0.204
x_c = 0.25
y_c = 0.5
M = 1.1



# shock part
if  x < 0.5 + epsilon * X: 
    rho = 1.0;
    ux = sqrt(GAMMA);
    uy = 0.0;
    p = 1.0;
else:
    rho = 1.0 / 1.1;
    ux = 1.1 * sqrt(GAMMA);
    uy = 0.0;
    p = 1 - 0.1 * GAMMA;



# vortex part
if x < 0.5:
    tau = sqrt(pow(x - x_c, 2) + pow(y - y_c, 2)) / r_c;
    sin_theta = (y - y_c) / (tau * r_c);
    cos_theta = (x - x_c) / (tau * r_c);

    ux += epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * sin_theta;
    uy += -epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * cos_theta;
    p += -(GAMMA - 1) * pow(epsilon, 2) * exp(2 * alpha*(1 - pow(tau, 2))) / (4 * alpha * GAMMA) * rho;



         �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_shockvortex_dash_template_dash_shockvortex_DOT_xml          �<config>
<fvm>
    <name>
      shockvortex
    </name>
    <platform>cpu</platform>
    <grid>
        <lowerCorner>0 0 0</lowerCorner>
        <upperCorner>1 1 0</upperCorner>
        <dimension>1024 1024 1</dimension>
    </grid>
    <boundary>neumann</boundary>
    <flux>HLL3</flux>
    <endTime>0.0035</endTime>
    <equation>euler2</equation>
    <equationParameters>
        <gamma>1.66666666666667</gamma>
    </equationParameters>
    <reconstruction>weno2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>shockvortex.py</python>
      <parameters>
	<parameter>
          <name>X</name>
          <length>1</length>
          <value>0</value>
	</parameter>

        <parameter>
          <name>epsilon</name>
          <length>1</length>
          <value>0.03</value>
	</parameter>

      </parameters>

    </initialData>
    <diffusion>
        <name>none</name>
        <reconstruction>none</reconstruction>
    </diffusion>
    <writer>
        <type>netcdf</type>
        <basename>shockvortex</basename>
        <numberOfSaves>1</numberOfSaves>
    </writer>
</fvm>
<uq>
  <samples>1</samples>
  <sampleStart>0</sampleStart>
  <generator>auto</generator>
  <parameters>
    <parameter>
      <name>X</name>
      <length>1</length>
      <type>uniform</type>
    </parameter>
  </parameters>
  <stats>
    <stat>
      <name>
	structure_cube
      </name>
      <numberOfSaves>1</numberOfSaves>
      <numberOfH>32</numberOfH>
      <p>1</p>
      <writeInitialTimestep>true</writeInitialTimestep>
      <writer>
	<type>netcdf</type>
	<basename>shockvortex</basename>
      </writer>
    </stat>
    <stat>
      <name>
	structure_cube
      </name>
      <numberOfSaves>1</numberOfSaves>
      <numberOfH>32</numberOfH>
      <p>2</p>
      <writeInitialTimestep>true</writeInitialTimestep>
      <writer>
	<type>netcdf</type>
	<basename>shockvortex</basename>
      </writer>
    </stat>
    <stat>
      <name>
	structure_cube
      </name>
      <numberOfSaves>1</numberOfSaves>
      <numberOfH>32</numberOfH>
      <p>3</p>
      <writeInitialTimestep>true</writeInitialTimestep>
      <writer>
	<type>netcdf</type>
	<basename>shockvortex</basename>
      </writer>
    </stat>

  </stats>
  </uq>
</config>
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false          uqAttributes.fvm.name             
      shockvortex
            uqAttributes.fvm.platform             cpu        !uqAttributes.fvm.grid.lowerCorner             0 0 0          !uqAttributes.fvm.grid.upperCorner             1 1 0          uqAttributes.fvm.grid.dimension           1024 1024 1        uqAttributes.fvm.boundary             neumann        uqAttributes.fvm.flux             HLL3       uqAttributes.fvm.endTime          0.0035         uqAttributes.fvm.equation             euler2         )uqAttributes.fvm.equationParameters.gamma             1.66666666666667       uqAttributes.fvm.reconstruction           weno2          uqAttributes.fvm.cfl          auto       uqAttributes.fvm.integrator           auto       #uqAttributes.fvm.initialData.python           shockvortex.py         6uqAttributes.fvm.initialData.parameters.parameter.name            epsilon        8uqAttributes.fvm.initialData.parameters.parameter.length          1          7uqAttributes.fvm.initialData.parameters.parameter.value           0.03       uqAttributes.fvm.diffusion.name           none       )uqAttributes.fvm.diffusion.reconstruction             none       uqAttributes.fvm.writer.type          netcdf          uqAttributes.fvm.writer.basename          shockvortex        %uqAttributes.fvm.writer.numberOfSaves             1          uqAttributes.uq.samples           1          uqAttributes.uq.sampleStart           0          uqAttributes.uq.generator             auto       )uqAttributes.uq.parameters.parameter.name             X          +uqAttributes.uq.parameters.parameter.length           1          )uqAttributes.uq.parameters.parameter.type             uniform        uqAttributes.uq.stats.stat.name           
	structure_cube
              (uqAttributes.uq.stats.stat.numberOfSaves          1          $uqAttributes.uq.stats.stat.numberOfH          32         uqAttributes.uq.stats.stat.p          3          /uqAttributes.uq.stats.stat.writeInitialTimestep           true       &uqAttributes.uq.stats.stat.writer.type            netcdf         *uqAttributes.uq.stats.stat.writer.basename            shockvortex                  time                                           ,        rho                                                         ,       mx                                                          -       my                                                          .       E                                                           /                                                                                                        ?�i�F]?<�����8?OT8��;�?[X��T�Q?etPYC�?n"]���h?t`��AL�?z{�Q~�T?��|�@�?����b�?�ʂ�|��?�o���?�=���F�?��W�(D?���~���?� �-p'?�R6����?�ke+��?�G+����?�<o699?�K/����?�sm??��'f鞙?�^��0y?���kϹ?�	���ٕ?�]x�;�?��t�u?�+bd5?��t˃j�?�,E�(U        >�)ݴaJ0>�\PUsR�>�s`K� >Ѩ��>�|��Y��>먹&�,�>��J\���>��|���?8r��	?-i/�8�?�~6-?���$w? 7���@�?$$ԭ��?(��c2XM?-ǟ�);�?1�|#)��?51��{?8��% \0?<�s���_?@�5Ә?B�"n���?E����?Hd iu�?Kz	���?N�Jz
g�?Q1W����?S�z�o�?U)����?WZ�˅�?Y�M��        >|�QEN�I>���B� >�X��@\>�n�A?p>�_�#���>뎡��ti>�w͌��>��t\6��?8G�]��?0޿!��?�pC�[�?����? <�Qɂ�?$+j��?(�c�??-�qr5�I?1�#}.qe?59 ���?8�.��"?<���Ó�?@�����4?B�E�?E��F�?Hm���[?K��u�B�?N�p���?Q8V��6?S$Ǒ
�?U2&�LA�?Wc-���?Y�t/�        ?9 T�=@@?X�
"�H?jY��q�b?w�*v6h?��G?��?�]�bʯ\?�(O��>?�N�/$?� \��j�?�O�D�?��pj&�?�Ѳ�o
!?�wz�H�?���M��?�N���?��<�q�?���$K�r?���,�Y?������?���i7?��&��D?ī3,�T$?ƕ_�S?Ȕ�1Q|?ʪӬ)�?��V�Ǽ?�m�ȣ?ж����K?���,?�.j�*!?�z�� a