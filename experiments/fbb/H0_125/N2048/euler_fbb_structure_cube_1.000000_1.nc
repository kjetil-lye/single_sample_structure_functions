CDF           
              t                 x          @       y                 z                    q       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            T/cluster/scratch/klye/single_sample_structure_functions/experiments/fbb/H0_125/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-042          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190713T082438        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           1          alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py            �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml           O<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <writer>
      <type>netcdf</type>
      <basename>euler_fbb</basename>
      <numberOfSaves>1</numberOfSaves>
    </writer>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false          uqAttributes.fvm.name             
    euler_fbb
            uqAttributes.fvm.platform             cuda       !uqAttributes.fvm.grid.lowerCorner             0 0 0          !uqAttributes.fvm.grid.upperCorner             1 1 0          uqAttributes.fvm.grid.dimension           2048 2048 1        uqAttributes.fvm.boundary             periodic       uqAttributes.fvm.flux             hll3       uqAttributes.fvm.endTime          4          uqAttributes.fvm.equation             euler2         )uqAttributes.fvm.equationParameters.gamma             1.4        uqAttributes.fvm.reconstruction           wenof2         uqAttributes.fvm.cfl          auto       uqAttributes.fvm.integrator           auto       #uqAttributes.fvm.initialData.python           euler_fbb.py       6uqAttributes.fvm.initialData.parameters.parameter.name            X          8uqAttributes.fvm.initialData.parameters.parameter.length          8380418        7uqAttributes.fvm.initialData.parameters.parameter.value           0.125          >uqAttributes.fvm.initialData.parameters.parameter.values.value            0          uqAttributes.fvm.diffusion.name           none       )uqAttributes.fvm.diffusion.reconstruction             none       uqAttributes.fvm.writer.type          netcdf          uqAttributes.fvm.writer.basename          	euler_fbb          %uqAttributes.fvm.writer.numberOfSaves             1          ,uqAttributes.fvm.functionals.functional.name          structure_cube         )uqAttributes.fvm.functionals.functional.p             3          1uqAttributes.fvm.functionals.functional.numberOfH             64         5uqAttributes.fvm.functionals.functional.numberOfSaves             8          3uqAttributes.fvm.functionals.functional.writer.type           netcdf         7uqAttributes.fvm.functionals.functional.writer.basename           5euler_fbb_functional_time_integrated_structure_cube_3          ,uqAttributes.fvm.functionals.functional.time          3.92       2uqAttributes.fvm.functionals.functional.timeRadius            0.08       uqAttributes.uq.samples           1          uqAttributes.uq.generator             auto       uqAttributes.uq.sampleStart           0          )uqAttributes.uq.parameters.parameter.name             X          +uqAttributes.uq.parameters.parameter.length           8380418        )uqAttributes.uq.parameters.parameter.type             uniform        uqAttributes.uq.stats.stat.name           
	structure_cube
              (uqAttributes.uq.stats.stat.numberOfSaves          1          $uqAttributes.uq.stats.stat.numberOfH          64         uqAttributes.uq.stats.stat.p          3          /uqAttributes.uq.stats.stat.writeInitialTimestep           true       &uqAttributes.uq.stats.stat.writer.type            netcdf         *uqAttributes.uq.stats.stat.writer.basename            	euler_fbb                    time                                           :        rho                                                         :       mx                                                          <       my                                                          >       E                                                           @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    @              ?�Z~�᰺?��t(���?��"�i�?򉷌)��?��``xJG@s�P��@	�1���@K�*��@�ʊ#O@�T\�@q��,G�@ ���O@"�XC�=@%uשX��@(�_@*�KnuH@-��Gs��@0W�X8�,@1���p�B@3tuhIA�@5(��>?@6����*@8y�&�@:<��X@<
h�Ж@=���x0@?Ś�z][@@�<q?F@AԜ5&B@B���ϿI@C�ʴ{K�@D�q7��@E��[�@G��y�@H��(��@I7uJ�؎@JWm�ŏ<@K{�΄tM@L� ��p@M�|G^�k@O4f�@P�WL�@P�l�`�@QUGq�=�@Q�rp<�@R��79��@S;�yB�@S�\Y�5�@T�n��@U2�n�9@U����k@V�7\ 6�@W:3~<@W����@X�u�O�@YQ�)�(�@Z�M	@@Z�YCK��@[x�aU�z@\3�_�@\���o*�@]��S�B�@^n�S ׇ        ?���m�ک?��+�z�?�M��*��?�.�FV�u@c<�Bm�@	�ّ��i@U2����@IA�|�F@�=�(I@ �5�i�@$=���h�@'�r�@?x@+���NT�@/��J,�@26'��+@4I�`�U@6��*��@93L��@;�K�ѵ�@>�(�Q�%@@�8�@'�@B1\I���@C�H�˔n@EP�L��@F��aU@H�����~@Jc�p�n�@L.��{��@N-��f@O�
���@P�0_u��@Q�gf�,�@R�=�r@S��}*��@U	�.�@V-��ٝ@W:d��p@X[%���Y@Y�]�eb@Z��9�|�@[����@]3(�n8@^O�
�N@_�PN�U@`k?Z�@ahi�\@a�F�*��@bb����\@cY�3��@c��H�z�@dp�y�0@e#㲓&@e���5�@f��R�1@gMS�0�@h
W���@hɖx,�l@i�
�N�@jN���{@k���B�@k�z]I�O@l���TH@mr���'        ?�'8�G��?�2�m��?즋w��?���2�@��"5F�@
P��	�H@���1�o@�D�@0��$k@!(�m���@$}�S4o�@(��i�-@+쥸�O@0�:,@2,�s�@4tr��y�@6�lIk8�@9]Z���@;����k�@>��Z�\�@@�G���@B@��9�@C�W��@EY,0���@F�q�Zi@H������@J^q��y�@L#�S�n�@M��6�6�@O�~LA�C@P��ܝ^�@Q���v��@R֎�ֈ@S۸��)d@T�^�~;@U�mEQ��@Wш&@X&y�xj:@YFU�f�3@ZkU �s�@[�h��w@\����@]������@_1��2]S@`7�"���@`��P@a|�o�@b"�����@b����7@cu~��0�@d"U��@d�f��I�@e���r@f6i-b@f믨,�T@g�f��yi@h]8���R@i @�I@i���m�@j��P��@kY'lq�<@l4�r��@l�?����        ?ќ~��s?�3��4=�?���`{[:@
ٸt��@��d�@��"�%@"r�xU�@'�ͅ4y5@->�A�׿@1�l����@5���n�@8�5�)|@<M��mz	@@!J36@B5u��@Da=�q&N@F��aL��@H��2:(@KpU�"yb@M��ԁ �@PH��S@Q����I@SVy�Β@Tm��IO@U����-@W`���@X��u0�@Zw[��.@\ƓUU�@]���V�%@_Y��@`�Z	�?�@aa��I<U@bB${�;�@c&>��@dZc,�@d��9��@e菘)�\@f��7hj@g�%�(�@hʖ�\��@i�e7��@jǄOI�W@k��^=��@lт����@m�LD��@n�9��@o�DI^�@p���kM2@q˗���@q�j�[._@r+����k@r�.kQ�@sLL���@s��L>�@tr��y �@ui�\
�@u�Oݙ�M@v7���f�@v�P��:)@wld�M�@xן��@x���J�